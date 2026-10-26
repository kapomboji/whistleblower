import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:WhistleBlower/core/network/api_config.dart';
import 'package:WhistleBlower/core/network/organization_service.dart';
import 'package:WhistleBlower/core/network/report_submission_service.dart';
import 'package:WhistleBlower/features/home/presentation/report_fraud_flow_data.dart';

void main() {
  group('OrganizationService', () {
    test('loads, trims, sorts, and de-duplicates API organizations', () async {
      final client = MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url, ApiConfig.organizationsUri);
        return http.Response(
          jsonEncode({
            'organizations': [
              {'name': 'Zeta'},
              {'name': ' Malawi Revenue Authority '},
              {'name': 'Zeta'},
              {'name': ''},
            ],
          }),
          200,
        );
      });
      final service = OrganizationService(client: client);

      expect(await service.fetchOrganizations(), [
        'Malawi Revenue Authority',
        'Zeta',
      ]);

      service.dispose();
    });

    test('surfaces API failures', () async {
      final service = OrganizationService(
        client: MockClient((_) async => http.Response('unavailable', 503)),
      );

      await expectLater(
        service.fetchOrganizations(),
        throwsA(isA<OrganizationServiceException>()),
      );

      service.dispose();
    });
  });

  group('ReportSubmissionService', () {
    setUp(() {
      ReportFraudFlowData.currentReportTitle = 'Report Fraud / Theft';
      ReportFraudFlowData.organisation = 'Malawi Revenue Authority';
      ReportFraudFlowData.location = 'Lilongwe';
      ReportFraudFlowData.incident = 'Description of the incident';
      ReportFraudFlowData.personInvolved = 'Manager';
      ReportFraudFlowData.incidentDate = '10/26/2026 • 9:00 AM';
      ReportFraudFlowData.additionalInformation = 'Witness details';
      ReportFraudFlowData.attention = 'How it came to my attention';
      ReportFraudFlowData.fullName = '';
      ReportFraudFlowData.phoneNumber = '';
      ReportFraudFlowData.emailAddress = '';
      ReportFraudFlowData.rewardOptIn = false;
      ReportFraudFlowData.attachments = [];
    });

    test('posts valid report fields to the deployed API route', () async {
      final client = MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url, ApiConfig.reportsUri);
        expect(request.headers['Origin'], ApiConfig.requestOrigin);
        expect(
          request.headers['content-type'],
          startsWith('multipart/form-data; boundary='),
        );
        expect(request.body, contains('name="concernSlug"\r\n\r\nfraud-theft'));
        expect(
          request.body,
          contains('name="organisation"\r\n\r\nMalawi Revenue Authority'),
        );
        expect(request.body, contains('name="location"\r\n\r\nLilongwe'));
        expect(request.body, contains('name="incidentDate"\r\n\r\n2026-10-26'));
        expect(
          request.body,
          contains('name="rewardParticipation"\r\n\r\nfalse'),
        );
        expect(request.body, isNot(contains('filename=')));

        return http.Response(
          jsonEncode({'caseNumber': 'WB-FT-123456', 'status': 'received'}),
          201,
        );
      });
      final service = ReportSubmissionService(client: client);

      expect(await service.submitReport(), 'WB-FT-123456');

      service.dispose();
    });

    test(
      'returns API validation failures instead of reporting success',
      () async {
        final service = ReportSubmissionService(
          client: MockClient(
            (_) async =>
                http.Response(jsonEncode({'error': 'Validation failed.'}), 400),
          ),
        );

        await expectLater(
          service.submitReport(),
          throwsA(
            isA<ReportSubmissionException>().having(
              (error) => error.message,
              'message',
              'Validation failed.',
            ),
          ),
        );

        service.dispose();
      },
    );
  });
}
