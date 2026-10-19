import 'package:flutter/material.dart';

import '../../../core/network/connectivity_service.dart';
import '../../../routing/app_router.dart';
import '../../../theme/app_theme.dart';
import 'splash_preloader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _connectivityService = ConnectivityService();
  bool _checkingConnection = false;
  bool _dialogVisible = false;

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  Future<void> _finishSplash() async {
    if (_checkingConnection || !mounted) return;
    setState(() => _checkingConnection = true);

    final isConnected = await _connectivityService.hasInternetConnection();
    if (!mounted) return;

    await _precacheWelcomeAssets();
    if (!mounted) return;

    setState(() => _checkingConnection = false);
    if (isConnected) {
      Navigator.of(context).pushReplacementNamed(AppRouter.home);
      return;
    }

    await _showOfflineDialog();
  }

  Future<void> _precacheWelcomeAssets() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/logo.png'), context),
      precacheImage(const AssetImage('assets/anony.png'), context),
      precacheImage(const AssetImage('assets/fwd.png'), context),
    ]);
  }

  Future<void> _showOfflineDialog() async {
    if (_dialogVisible || !mounted) return;
    _dialogVisible = true;

    final shouldRetry = await showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog.adaptive(
          title: const Text('No internet connection'),
          content: const Text(
            'Connect to the internet to continue using Whistle Blower™\'s.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Try again'),
            ),
          ],
        );
      },
    );

    _dialogVisible = false;
    if (shouldRetry == true && mounted) {
      await _finishSplash();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _LoaderMark(onCompleted: _finishSplash),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Speak Up Safely, Protect What Matters.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 10,
                    fontFamily: "CreatoDisplay",
                    fontWeight: FontWeight.w700,
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

class _LoaderMark extends StatefulWidget {
  const _LoaderMark({required this.onCompleted});

  final VoidCallback onCompleted;

  @override
  State<_LoaderMark> createState() => _LoaderMarkState();
}

class _LoaderMarkState extends State<_LoaderMark> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) widget.onCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: SplashPreloader());
  }
}
