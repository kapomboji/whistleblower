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
    _generateCaseNumber();
  }

  String _casePrefixForReport(String reportTitle) {
    switch (reportTitle) {
      case 'Report Fraud / Theft':
        return 'WB/FT';
      case 'Report Bribery / Corruption':
        return 'WB/BC';
      case 'Report Conflicts of Interest':
        return 'WB/CI';
      case 'Report Harassment / Discrimination':
        return 'WB/HD';
      case 'Report Procurement Irregularities':
        return 'WB/PI';
      case 'Report Abuse of Authority':
        return 'WB/AA';
      case 'Report Financial Misreporting':
        return 'WB/FM';
      case 'Report Breaches of Company Policy':
        return 'WB/CP';
      case 'Report Serious Health, Safety and Environmental Violations':
        return 'WB/SHSEV';
      default:
        return 'WB/OT';
    }
  }

  void _generateCaseNumber() {
    final now = DateTime.now();
    final year = now.year;
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final caseNumber = (now.millisecondsSinceEpoch % 1000000).toString().padLeft(6, '0');
    final prefix = _casePrefixForReport(widget.reportTitle);
    final generatedCaseNumber = '$prefix/$year/$month/$day/$caseNumber';
    _caseNumberController.text = generatedCaseNumber;
    ReportFraudFlowData.currentCaseNumber = generatedCaseNumber;
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

    final formattedDate = '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
    _dateTimeController.text = '$formattedDate • ${time.format(context)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            FraudTopBar(title: widget.reportTitle),
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
                      const SectionHeader(title: 'CASE INFORMATION'),
                      const SizedBox(height: 12),
                      Text(
                        'Case Number',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ReportField(
                        controller: _caseNumberController,
                        hintText: '',
                        prefixSvgAssetPath: 'assets/number.svg',
                        readOnly: true,
                        animationDelay: 1,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Company / Organization Name',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownMenu<String>(
                        controller: _companyController,
                        width: double.infinity,
                        enableFilter: true,
                        requestFocusOnTap: true,
                        menuHeight: 280,
                        leadingIcon: const Icon(Icons.apartment, color: AppColors.darkBlue),
                        hintText: 'Search organization',
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: const Color(0xFFF1F2F7),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: AppColors.background, width: 2.0),
                          ),
                          labelStyle: TextStyle(color: AppColors.darkBlue),
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
                      const SizedBox(height: 12),
                      Text(
                        'Division / Branch / Site',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
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
                      Text(
                        'Describe What Happened',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
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
                      const SizedBox(height: 12),
                      Text(
                        'Name Or Role Of Person Involved',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
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
                      Text(
                        'When Did It Happen?',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ReportField(
                        controller: _dateTimeController,
                        hintText: 'Select date and time',
                        prefixIcon: Icons.calendar_today,
                        readOnly: true,
                        onTap: _pickIncidentDateTime,
                        requiredField: false,
                        animationDelay: 5,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRouter.reportFraudMoreDetails);
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
                      const SizedBox(height: 10),
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
