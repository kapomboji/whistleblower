import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';
import 'report_fraud_flow_data.dart';
import 'report_fraud_flow_widgets.dart';

class ReportFraudOrganizationPage extends StatefulWidget {
  const ReportFraudOrganizationPage({
    this.reportTitle = 'Report Fraud / Theft',
    super.key,
  });

  final String reportTitle;

  @override
  State<ReportFraudOrganizationPage> createState() =>
      _ReportFraudOrganizationPageState();
}

class _ReportFraudOrganizationPageState
    extends State<ReportFraudOrganizationPage> {
  static const List<String> _malawiCompanies = [
    'AMG Global',
    'Whistleblower',
    'Mystery Shopper',
  ];

  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
  final _divisionController = TextEditingController();
  final _caseNumberController = TextEditingController();
  final _incidentController = TextEditingController();
  final _personRoleController = TextEditingController();
  final _dateTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _companyController.dispose();
    _divisionController.dispose();
    _caseNumberController.dispose();
    _incidentController.dispose();
    _personRoleController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  Future<void> _pickIncidentDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.background,
              onPrimary: AppColors.white,
              onSurface: AppColors.darkBlue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.background,
              onPrimary: AppColors.white,
              onSurface: AppColors.darkBlue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (time == null || !mounted) return;

    final formattedDate =
        '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
    _dateTimeController.text = '$formattedDate • ${time.format(context)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            FraudTopBar(title: widget.reportTitle),
            Expanded(
              child: Container(
                color: AppColors.white,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 680),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionHeader(title: 'Case Information'),
                            const SizedBox(height: 20),
                            Text(
                              'Case Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ReportField(
                              controller: _caseNumberController,
                              hintText: 'Assigned after submission',
                              prefixSvgAssetPath: 'assets/number.svg',
                              readOnly: true,
                              animationDelay: 1,
                              requiredField: false,
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Company / Institution / Organization Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            DropdownMenu<String>(
                              controller: _companyController,
                              width: double.infinity,
                              enableFilter: true,
                              requestFocusOnTap: true,
                              menuHeight: 280,
                              leadingIcon: const Icon(
                                Icons.apartment,
                                color: Color(0xFF5C5C5C),
                                size: 18,
                              ),
                              trailingIcon: const SizedBox.shrink(),
                              selectedTrailingIcon: const SizedBox.shrink(),
                              hintText: '',
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              inputDecorationTheme: InputDecorationTheme(
                                filled: true,
                                isDense: true,
                                constraints: const BoxConstraints(
                                  minHeight: 44,
                                ),
                                fillColor: const Color(0xFFF0F0F0),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(
                                    color: AppColors.background,
                                    width: 2,
                                  ),
                                ),
                              ),
                              dropdownMenuEntries: _malawiCompanies
                                  .map(
                                    (company) => DropdownMenuEntry<String>(
                                      value: company,
                                      label: company,
                                    ),
                                  )
                                  .toList(),
                              onSelected: (value) {
                                if (value != null) {
                                  _companyController.text = value;
                                }
                              },
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Division / Branch and City / District',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ReportField(
                              controller: _divisionController,
                              hintText: '',
                              prefixIcon: Icons.location_on,
                              animationDelay: 2,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Describe what happened...',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ReportField(
                              controller: _incidentController,
                              hintText: '',
                              maxLines: 6,
                              heroTag: 'incident_description',
                              animationDelay: 3,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Name or role of person involved',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ReportField(
                              controller: _personRoleController,
                              hintText: '',
                              prefixIcon: Icons.person,
                              animationDelay: 4,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'When did it happen?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ReportField(
                              controller: _dateTimeController,
                              hintText: '',
                              prefixIcon: Icons.calendar_today,
                              readOnly: true,
                              onTap: _pickIncidentDateTime,
                              animationDelay: 5,
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              height: 46,
                              child: FilledButton(
                                onPressed: () {
                                  if (_companyController.text.trim().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Please enter an organization name.',
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                  if (!(_formKey.currentState?.validate() ??
                                      false)) {
                                    return;
                                  }
                                  ReportFraudFlowData.organisation =
                                      _companyController.text.trim();
                                  ReportFraudFlowData.location =
                                      _divisionController.text.trim();
                                  ReportFraudFlowData.incident =
                                      _incidentController.text.trim();
                                  ReportFraudFlowData.personInvolved =
                                      _personRoleController.text.trim();
                                  ReportFraudFlowData.incidentDate =
                                      _dateTimeController.text.trim();
                                  Navigator.of(
                                    context,
                                  ).pushNamed(AppRouter.reportFraudMoreDetails);
                                },
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
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
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
