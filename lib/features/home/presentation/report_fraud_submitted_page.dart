import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';

class ReportFraudSubmittedPage extends StatelessWidget {
  const ReportFraudSubmittedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF49B3F3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 36),
            Column(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/submitted.svg',
                      width: 52,
                      height: 52,
                      colorFilter: const ColorFilter.mode(AppColors.background, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'REPORT SUBMITTED',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Thank you for submitting your report.\n\nYour report has been received and will be reviewed in accordance with Whistle Blower™\'s reporting procedures. If you provided contact details, you may be contacted should additional information be required.\n\nYour reference number has been generated for future correspondence. Please keep it in a safe place.\n\nWhistle Blower™ is a member firm of AMG Global Chartered Accountants and Business Advisors.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              
              children: [
                SizedBox(
                  width: 380,
                  height: 48,
                    
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                     
                      backgroundColor: AppColors.darkBlue,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    child: const Text(
                      'FINISH',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Speak Up Safely, Protect What Matters.',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
