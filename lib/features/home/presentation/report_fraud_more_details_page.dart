import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';
import 'report_fraud_flow_data.dart';
import 'report_fraud_flow_widgets.dart';

class ReportFraudMoreDetailsPage extends StatefulWidget {
  const ReportFraudMoreDetailsPage({super.key});

  @override
  State<ReportFraudMoreDetailsPage> createState() =>
      _ReportFraudMoreDetailsPageState();
}

class _ReportFraudMoreDetailsPageState
    extends State<ReportFraudMoreDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _witnessDetailsController = TextEditingController();
  final _attentionDetailsController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();

  @override
  void dispose() {
    _witnessDetailsController.dispose();
    _attentionDetailsController.dispose();
    _fullNameController.dispose();
    _contactNumberController.dispose();
    _emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            FraudTopBar(title: ReportFraudFlowData.currentReportTitle),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeader(title: 'More Details'),
                      const Text(
                        'Witness, victims / other relevant details (if available)',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ReportField(
                        controller: _witnessDetailsController,
                        hintText: 'Enter details here',
                        // prefixIcon: Icons.group,
                        maxLines: 5,
                        heroTag: 'incident_description',
                        requiredField: false,
                        animationDelay: 0,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Describe how it came to your attention (if available)',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ReportField(
                        controller: _attentionDetailsController,
                        hintText: 'Enter details here',
                        // prefixIcon: Icons.visibility,
                        maxLines: 5,
                        requiredField: false,
                        animationDelay: 1,
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Personal Details (Optional)',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Full Name (Optional)',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ReportField(
                        controller: _fullNameController,
                        hintText: '',
                        prefixIcon: Icons.person,
                        requiredField: false,
                        animationDelay: 2,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Contact Number (Optional)',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ReportField(
                        controller: _contactNumberController,
                        hintText: '',
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        requiredField: false,
                        animationDelay: 3,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'E mail Address (Optional)',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ReportField(
                        controller: _emailAddressController,
                        hintText: '',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        requiredField: false,
                        animationDelay: 4,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your identity will never be divulged.',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRouter.reportFraudAttachment);
                            }
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.background,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text(
                            'SAVE AND CONTINUE',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
