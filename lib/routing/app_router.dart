import 'package:flutter/material.dart';
import '../features/home/presentation/home_page.dart';
import '../features/splash/presentation/splash_page.dart';
import '../features/home/presentation/home_main.dart';
import '../features/home/presentation/report_fraud_organization_page.dart';
import '../features/home/presentation/report_fraud_more_details_page.dart';
import '../features/home/presentation/report_fraud_attachment_page.dart';
import '../features/home/presentation/report_fraud_submitted_page.dart';
import '../features/home/presentation/report_fraud_acknowledgement_page.dart';
import '../features/home/presentation/report_fraud_flow_data.dart';
import '../features/home/presentation/about_page.dart';

abstract final class AppRouter {
  static const splash = '/';
  static const home = '/home';
  static const homemain = '/home_main';
  static const reportFraud = '/report_fraud';
  static const reportFraudMoreDetails = '/report_fraud/more_details';
  static const reportFraudAttachment = '/report_fraud/attachment';
  static const reportFraudAcknowledgement = '/report_fraud/acknowledgement';
  static const reportFraudSubmitted = '/report_fraud/submitted';
  static const about = '/about';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _page(const SplashPage(), settings);
      case home:
        return _page(const HomePage(), settings);
      case homemain:
        return _page(const HomeMain(), settings);
      case reportFraud:
        final reportTitle = settings.arguments as String? ?? 'Report Fraud / Theft';
        ReportFraudFlowData.currentReportTitle = reportTitle;
        return _page(ReportFraudOrganizationPage(reportTitle: reportTitle), settings);
      case reportFraudMoreDetails:
        return _page(const ReportFraudMoreDetailsPage(), settings);
      case reportFraudAttachment:
        return _page(const ReportFraudAttachmentPage(), settings);
      case reportFraudAcknowledgement:
        return _page(const ReportFraudAcknowledgementPage(), settings);
      case reportFraudSubmitted:
        return _page(const ReportFraudSubmittedPage(), settings);
      case about:
        return _page(const AboutPage(), settings);
      default:
        return _page(const SplashPage(), settings);
    }
  }

  static PageRouteBuilder<void> _page(Widget child, RouteSettings settings) {
    return PageRouteBuilder<void>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 650),
      reverseTransitionDuration: const Duration(milliseconds: 550),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fadeTween = Tween<double>(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.easeInOut),
        );

        return FadeTransition(
          opacity: animation.drive(fadeTween),
          child: child,
        );
      },
    );
  }
}
