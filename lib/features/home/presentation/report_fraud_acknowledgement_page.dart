import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/network/report_submission_service.dart';
import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';
import 'report_fraud_flow_data.dart';

class ReportFraudAcknowledgementPage extends StatefulWidget {
  const ReportFraudAcknowledgementPage({super.key, this.caseNumber});

  final String? caseNumber;

  @override
  State<ReportFraudAcknowledgementPage> createState() =>
      _ReportFraudAcknowledgementPageState();
}

class _ReportFraudAcknowledgementPageState
    extends State<ReportFraudAcknowledgementPage> {
  bool _acknowledged = false;
  bool _isSubmitting = false;
  String get _caseNumber =>
      widget.caseNumber ?? ReportFraudFlowData.currentCaseNumber;
  final ReportSubmissionService _submissionService = ReportSubmissionService();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _copyCaseNumber() async {
    if (_caseNumber.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: _caseNumber));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Case number copied: $_caseNumber'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _submissionService.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    if (!_acknowledged) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please acknowledge before submitting')),
      );
      return;
    }
    setState(() {
      _isSubmitting = true;
    });
    try {
      ReportFraudFlowData.currentCaseNumber = await _submissionService
          .submitReport();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRouter.reportFraudSubmitted);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to submit report: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF49B3F3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 32),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.lock_outlined,
                        size: 44,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Acknowledgement',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        const Text(
                          'I confirm that the information provided in this report is true and accurate to the best of my knowledge. I understand that the information provided will be reviewed in accordance with Whistle Blower™\'s reporting procedures.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: _acknowledged
                                ? Border.all(
                                    color: const Color(0xFF00B894),
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _acknowledged = !_acknowledged;
                              });
                            },
                            child: Center(
                              child: _acknowledged
                                  ? const Icon(
                                      Icons.check,
                                      size: 28,
                                      color: Color(0xFF00B894),
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (_caseNumber.isNotEmpty)
                          GestureDetector(
                            onTap: _copyCaseNumber,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.white.withValues(
                                    alpha: 0.55,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.copy_all_rounded,
                                    size: 16,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _caseNumber,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          const Text(
                            'Your reference number will be assigned after submission.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: _isSubmitting ? null : _submitReport,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: const Color(0xFF49B3F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'SAVE AND REPORT',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
