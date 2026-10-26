import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';
import 'report_fraud_flow_data.dart';
import 'report_fraud_flow_widgets.dart';

class ReportFraudRewardsPage extends StatefulWidget {
  const ReportFraudRewardsPage({super.key});

  @override
  State<ReportFraudRewardsPage> createState() => _ReportFraudRewardsPageState();
}

class _ReportFraudRewardsPageState extends State<ReportFraudRewardsPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _physicalAddressController = TextEditingController();
  bool _optedIn = false;
  String? _nationalIdPath;
  String? _nationalIdName;

  @override
  void dispose() {
    _fullNameController.dispose();
    _contactNumberController.dispose();
    _emailAddressController.dispose();
    _physicalAddressController.dispose();
    super.dispose();
  }

  Future<void> _pickNationalId() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );
    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;
    if (file.path == null) return;
    setState(() {
      _nationalIdPath = file.path;
      _nationalIdName = file.name;
    });
  }

  Future<void> _captureNationalId() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _nationalIdPath = image.path;
      _nationalIdName = image.name;
    });
  }

  void _continue() {
    if (_optedIn && !(_formKey.currentState?.validate() ?? false)) return;

    ReportFraudFlowData.rewardOptIn = _optedIn;
    ReportFraudFlowData.rewardFullName = _optedIn
        ? _fullNameController.text.trim()
        : '';
    ReportFraudFlowData.rewardContactNumber = _optedIn
        ? _contactNumberController.text.trim()
        : '';
    ReportFraudFlowData.rewardEmailAddress = _optedIn
        ? _emailAddressController.text.trim()
        : '';
    ReportFraudFlowData.rewardPhysicalAddress = _optedIn
        ? _physicalAddressController.text.trim()
        : '';
    ReportFraudFlowData.rewardNationalIdPath = _optedIn
        ? _nationalIdPath
        : null;

    Navigator.of(context).pushNamed(AppRouter.reportFraudAcknowledgement);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            FraudTopBar(title: ReportFraudFlowData.currentReportTitle),
            Expanded(
              child: Container(
                color: AppColors.white,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(30, 18, 30, 16),
                    children: [
                      const Text(
                        'REWARDS & RECOGNITION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Some organizations may offer rewards for eligible reports. If you wish to participate, you can provide your personal details so you can be contacted regarding the reward.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Your report can remain completely anonymous. Providing personal details is optional and is only necessary if you choose to participate in a reward programme.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Choosing not to provide your details will not affect your ability to submit or follow up on a report.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 22),
                      const SizedBox(height: 2),
                      const Text(
                        'I would like to participate in the rewards programme',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Center(
                        child: Checkbox(
                          value: _optedIn,
                          onChanged: (value) {
                            setState(() {
                              _optedIn = value ?? false;
                            });
                          },
                          activeColor: AppColors.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      if (_optedIn) ...[
                        const SizedBox(height: 18),
                        const Text(
                          'Full Name',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        ReportField(
                          controller: _fullNameController,
                          hintText: '',
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Contact Number',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        ReportField(
                          controller: _contactNumberController,
                          hintText: '',
                          prefixIcon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Email Address (Optional)',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        ReportField(
                          controller: _emailAddressController,
                          hintText: '',
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          requiredField: false,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Upload or Scan Your National ID',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: 92,
                              height: 30,
                              child: FilledButton(
                                onPressed: _pickNationalId,
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.background,
                                  foregroundColor: AppColors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  _nationalIdName ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 36,
                              height: 30,
                              child: IconButton.filled(
                                onPressed: _captureNationalId,
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.camera_alt, size: 22),
                                style: IconButton.styleFrom(
                                  backgroundColor: AppColors.background,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Physical / Contact Address',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        ReportField(
                          controller: _physicalAddressController,
                          hintText: '',
                          maxLines: 4,
                          prefixIcon: Icons.location_on,
                          requiredField: false,
                        ),
                      ],
                      const SizedBox(height: 18),
                      SizedBox(
                        height: 46,
                        child: FilledButton(
                          onPressed: _continue,
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.background,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'SAVE AND CONTINUE',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
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
