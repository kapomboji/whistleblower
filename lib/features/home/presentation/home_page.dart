import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final horizontalPadding = width.clamp(24.0, 42.0);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                28,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _BrandLockup(),
                 
                  const Text(
                    'Welcome to Whistle Blower™',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 14,
                      fontFamily: "CreatoDisplay",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const _IntroductoryCopy(),
                  const SizedBox(height: 20),
                  const _SecondaryIcon(),
                  const SizedBox(height: 42),
                  const _ReportButton(),
                  const SizedBox(height: 18),
                  const Text(
                    'Speak Up Safely, Protect What Matters.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x7324396F),
                      fontSize: 14,
                      fontFamily: "CreatoDisplay",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandLockup extends StatelessWidget {
  const _BrandLockup();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VectorGraphic(
        loader: const AssetBytesLoader('assets/Whistle blower logo.vec'),
        width: 280,
        height: 280,
        fit: BoxFit.contain,
        semanticsLabel: 'Whistle Blower logo',
      ),
    );
  }
}

class _IntroductoryCopy extends StatelessWidget {
  const _IntroductoryCopy();

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'Whistle Blower™ is a member firm of ',
        children: [
          TextSpan(
            text: 'AMG Global',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          TextSpan(text: ' Chartered Accountants and Business Advisors.\n\n'),
          TextSpan(text: 'This platform allows anonymous reporting of suspected unethical, fraudulent, illegal, or other misconduct within organizations that subscribe to Whistle Blower™ independent whistleblowing service.'),
        ],
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF111111),
        fontSize: 14,
        fontFamily: "CreatoDisplay",
        height: 1.2,
      ),
    );
  }
}

class _SecondaryIcon extends StatelessWidget {
  const _SecondaryIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:40,
      height: 40,
      child: Image.asset(
        'assets/anony.png',
        fit: BoxFit.contain,
        cacheWidth: 40,
        cacheHeight: 40,
      ),
    );
  }
}

class _ReportButton extends StatelessWidget {
  const _ReportButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.homemain,
            (route) => false,
          );
        },
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REPORT ANONYMOUSLY',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/fwd.png',
              fit: BoxFit.contain,
              width: 15,
              height: 15,
              cacheWidth: 15,
              cacheHeight: 15,
            ),
          ],
        ),
      ),
    );
  }
}
