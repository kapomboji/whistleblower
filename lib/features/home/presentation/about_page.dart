import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 90,
                        height: 90,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.account_balance,
                            size: 48,
                            color: AppColors.darkBlue,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'About Us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CreatoDisplay',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Whistle Blower™ is a member firm of AMG Global Chartered Accountants and Business Advisors.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CreatoDisplay',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'We provide an independent whistleblowing service that enables organizations to receive anonymous reports of suspected unethical, fraudulent, illegal, or other misconduct through a secure reporting platform.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CreatoDisplay',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Our mission is to help organizations detect, prevent, and address fraud, corruption, unethical conduct, and other forms of misconduct while promoting transparency, accountability, and integrity.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CreatoDisplay',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'This platform is exclusively for organizations that subscribe to Whistle Blower™ whistleblowing service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CreatoDisplay',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Terms and Conditions Apply.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CreatoDisplay',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouter.homemain,
                    (route) => false,
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.darkBlue,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'BACK TO MENU',
                    style: TextStyle(
                      fontFamily: 'CreatoDisplay',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
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
}
