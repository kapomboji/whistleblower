import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  static const List<_ReportCategory> _categories = [
    _ReportCategory(
      title: 'Fraud\n& Theft',
      reportTitle: 'Report Fraud / Theft',
      iconPath: 'assets/Fraud.png',
    ),
    _ReportCategory(
      title: 'Bribery\n& Corruption',
      reportTitle: 'Report Bribery / Corruption',
      iconPath: 'assets/Bribery.png',
    ),
    _ReportCategory(
      title: 'Conflicts\nof Interest',
      reportTitle: 'Report Conflicts of Interest',
      iconPath: 'assets/Conflict.png',
    ),
    _ReportCategory(
      title: 'Harassment &\nDiscrimination',
      reportTitle: 'Report Harassment / Discrimination',
      iconPath: 'assets/Harrassment.png',
    ),
    _ReportCategory(
      title: 'Procurement\nIrregularities',
      reportTitle: 'Report Procurement Irregularities',
      iconPath: 'assets/Procurement.png',
    ),
    _ReportCategory(
      title: 'Abuse of\nAuthority',
      reportTitle: 'Report Abuse of Authority',
      iconPath: 'assets/AuthorityAbuse.png',
    ),
    _ReportCategory(
      title: 'Financial\nMisreporting',
      reportTitle: 'Report Financial Misreporting',
      iconPath: 'assets/Financial.png',
    ),
    _ReportCategory(
      title: 'Breaches of\nCompany Policy',
      reportTitle: 'Report Breaches of Company Policy',
      iconPath: 'assets/Ploicyb.png',
    ),
    _ReportCategory(
      title: 'Health, Safety\nand Environmental\nConcerns',
      reportTitle: 'Report Serious Health, Safety and Environmental Violations',
      iconPath: 'assets/health.png',
    ),
    _ReportCategory(
      title: 'Other\nConcerns',
      reportTitle: 'Report Other Concerns',
      iconPath: 'assets/others.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 34, 24, 16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo_mark.png',
                    width: 78,
                    height: 82,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'SELECT THE NATURE OF YOUR REPORT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(52),
                ),
                child: Container(
                  width: double.infinity,
                  color: AppColors.background,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 296),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (
                              var rowIndex = 0;
                              rowIndex < _categories.length ~/ 2;
                              rowIndex++
                            ) ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: _ReportCard(
                                      category: _categories[rowIndex * 2],
                                      onTap: () => _openReport(
                                        context,
                                        _categories[rowIndex * 2],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: _ReportCard(
                                      category: _categories[rowIndex * 2 + 1],
                                      showLeftDivider: true,
                                      onTap: () => _openReport(
                                        context,
                                        _categories[rowIndex * 2 + 1],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (rowIndex < _categories.length ~/ 2 - 1)
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: AppColors.white,
                                ),
                            ],
                            Padding(
                              padding: const EdgeInsets.only(top: 48),
                              child: Center(
                                child: InkWell(
                                  onTap: () => Navigator.of(
                                    context,
                                  ).pushNamed(AppRouter.about),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'About Whistle Blower™ Limited',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        SizedBox(
                                          width: 190,
                                          child: Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }

  void _openReport(BuildContext context, _ReportCategory category) {
    Navigator.of(
      context,
    ).pushNamed(AppRouter.reportFraud, arguments: category.reportTitle);
  }
}

class _ReportCategory {
  const _ReportCategory({
    required this.title,
    required this.reportTitle,
    required this.iconPath,
  });

  final String title;
  final String reportTitle;
  final String iconPath;
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.category,
    required this.onTap,
    this.showLeftDivider = false,
  });

  final _ReportCategory category;
  final VoidCallback onTap;
  final bool showLeftDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        border: showLeftDivider
            ? const Border(left: BorderSide(color: AppColors.white, width: 1))
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                category.iconPath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
