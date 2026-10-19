import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(38, 44, 38, 24),
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 70.0,
                            height: 70.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.darkBlue.withValues(alpha: 0.15)),
                            ),
                            child: const Icon(Icons.account_balance, size: 24, color: AppColors.darkBlue),
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Select the nature of your report.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "CreatoDisplay",
                          color: AppColors.darkBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: AppColors.background,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(45, 40, 45, 16),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Row(
                               children: [
                                  Expanded(
                                  child: _ReportCard(
                                    title: 'Fraud\n/ Theft',
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Fraud / Theft',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Bribery\n/ corruption',
                                    showLeftDivider: true,
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Bribery / Corruption',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              color: AppColors.white,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Conflicts \n of Intrest',
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Conflicts of Interest',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Harassment /\nDiscrimination',
                                    showLeftDivider: true,
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Harassment / Discrimination',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              color: AppColors.white,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Procurement\nirregularities',
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Procurement Irregularities',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Abuse of\nAuthority',
                                    showLeftDivider: true,
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Abuse of Authority',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              color: AppColors.white,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Financial\nMisreporting',
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Financial Misreporting',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Breaches of\nCompany Policy',
                                    showLeftDivider: true,
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Breaches of Company Policy',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              color: AppColors.white,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _ReportCard(
                                    title: 'Serious health, safety\nand Enviromental\nViolations',
                                    onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.reportFraud,
                                      arguments: 'Report Serious Health, Safety and Environmental Violations',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _ReportCard(
                                    title: 'About\nWhistle Blower™\nLimited',
                                    showLeftDivider: true,
                                    onTap: () => Navigator.of(context).pushNamed(AppRouter.about),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.title,
    this.showLeftDivider = false,
    this.onTap,
  });

  final String title;
  final bool showLeftDivider;
  final VoidCallback? onTap;
  final iconMap = const {
    'Fraud\n/ Theft': 'assets/Fraud.png',
    'Bribery\n/ corruption': 'assets/Bribery.png',
    'Conflicts \n of Intrest': 'assets/Conflict.png',
    'Harassment /\nDiscrimination': 'assets/Harrassment.png',
    'Procurement\nirregularities': 'assets/Procurement.png',
    'Abuse of\nAuthority': 'assets/AuthorityAbuse.png',
    'Financial\nMisreporting': 'assets/Financial.png',
    'Breaches of\nCompany Policy': 'assets/Ploicyb.png',
    'Serious health, safety\nand Enviromental\nViolations': 'assets/health.png',
    'About\nWhistle Blower™\nLimited': 'assets/Info.png'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.zero,
        border: showLeftDivider
            ? Border(
                left: BorderSide(
                  color: AppColors.white,
                  width: 1.0,
                ),
              )
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              final iconPath = iconMap[title];
              final Widget iconWidget = iconPath != null
                  ? Image.asset(
                      iconPath,
                      width: 32,
                      height: 32,
                      fit: BoxFit.scaleDown,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 32, color: AppColors.white);
                      },
                    )
                  : const Icon(Icons.image_not_supported, size: 32, color: AppColors.white);

              return iconWidget;
            }),
            const SizedBox(height: 2),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontFamily: "CreatoDisplay",
                      fontWeight: FontWeight.w400,
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