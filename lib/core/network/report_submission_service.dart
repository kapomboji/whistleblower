import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_config.dart';
import '../../features/home/presentation/report_fraud_flow_data.dart';

class ReportSubmissionService {
  ReportSubmissionService({http.Client? client})
    : _client = client ?? http.Client();

  static const _maximumFileBytes = 10 * 1024 * 1024;
  static const _maximumAttachments = 10;
  static const _requestTimeout = Duration(seconds: 90);

  final http.Client _client;

  Future<String> submitReport() async {
    final attachments = ReportFraudFlowData.attachments;
    if (attachments.length > _maximumAttachments) {
      throw const ReportSubmissionException(
        'A report can include up to 10 attachments.',
      );
    }

    final request = http.MultipartRequest('POST', ApiConfig.reportsUri)
      ..headers['Origin'] = ApiConfig.requestOrigin
      ..fields.addAll(_buildFields());

    for (final attachment in attachments) {
      final file = File(attachment.path);
      final fileSize = await file.length();
      if (fileSize > _maximumFileBytes) {
        throw ReportSubmissionException(
          '${attachment.name} is larger than the API limit of 10 MB.',
        );
      }
      request.files.add(
        await http.MultipartFile.fromPath(
          'attachments',
          attachment.path,
          filename: attachment.name,
        ),
      );
    }

    final streamedResponse = await _client
        .send(request)
        .timeout(_requestTimeout);
    final response = await http.Response.fromStream(
      streamedResponse,
    ).timeout(_requestTimeout);
    final body = _decodeResponse(response.body);

    if (response.statusCode != 201) {
      final message = body?['error'];
      throw ReportSubmissionException(
        message is String && message.isNotEmpty
            ? message
            : 'The report could not be submitted (HTTP ${response.statusCode}).',
      );
    }

    final caseNumber = body?['caseNumber'];
    if (caseNumber is! String || caseNumber.isEmpty) {
      throw const ReportSubmissionException(
        'The API accepted the report but did not return a reference number.',
      );
    }
    return caseNumber;
  }

  Map<String, String> _buildFields() {
    final dateParts = ReportFraudFlowData.incidentDate
        .split(' • ')
        .first
        .split('/');
    if (dateParts.length != 3) {
      throw const ReportSubmissionException(
        'Choose a valid date for when the incident happened.',
      );
    }
    final month = int.tryParse(dateParts[0]);
    final day = int.tryParse(dateParts[1]);
    final year = int.tryParse(dateParts[2]);
    if (month == null || day == null || year == null) {
      throw const ReportSubmissionException(
        'Choose a valid date for when the incident happened.',
      );
    }
    final date = DateTime(year, month, day);
    if (date.year != year || date.month != month || date.day != day) {
      throw const ReportSubmissionException(
        'Choose a valid date for when the incident happened.',
      );
    }

    return {
      'concernSlug': _concernSlug(ReportFraudFlowData.currentReportTitle),
      'organisation': ReportFraudFlowData.organisation,
      'location': ReportFraudFlowData.location,
      'incident': ReportFraudFlowData.incident,
      'personInvolved': ReportFraudFlowData.personInvolved,
      'incidentDate':
          '${date.year.toString().padLeft(4, '0')}-'
          '${date.month.toString().padLeft(2, '0')}-'
          '${date.day.toString().padLeft(2, '0')}',
      'additionalInformation': ReportFraudFlowData.additionalInformation,
      'attention': ReportFraudFlowData.attention,
      'fullName': ReportFraudFlowData.fullName,
      'phoneNumber': ReportFraudFlowData.phoneNumber,
      'emailAddress': ReportFraudFlowData.emailAddress,
      'rewardParticipation': ReportFraudFlowData.rewardOptIn.toString(),
      'rewardFullName': ReportFraudFlowData.rewardFullName,
      'rewardPhoneNumber': ReportFraudFlowData.rewardContactNumber,
      'rewardEmailAddress': ReportFraudFlowData.rewardEmailAddress,
      'rewardAddress': ReportFraudFlowData.rewardPhysicalAddress,
    };
  }

  String _concernSlug(String title) {
    return switch (title) {
      'Report Fraud / Theft' => 'fraud-theft',
      'Report Bribery / Corruption' => 'bribery-corruption',
      'Report Conflicts of Interest' => 'conflicts-of-interest',
      'Report Harassment / Discrimination' => 'harassment-discrimination',
      'Report Procurement Irregularities' => 'procurement-irregularities',
      'Report Abuse of Authority' => 'abuse-of-authority',
      'Report Financial Misreporting' => 'financial-misreporting',
      'Report Breaches of Company Policy' => 'policy-breaches',
      'Report Serious Health, Safety and Environmental Violations' =>
        'health-safety-environment',
      'Report Other Concerns' => 'other-concerns',
      _ => throw const ReportSubmissionException(
        'This report category is not supported.',
      ),
    };
  }

  Map<String, dynamic>? _decodeResponse(String body) {
    dynamic decoded;
    try {
      decoded = jsonDecode(body);
    } on FormatException {
      return null;
    }
    if (decoded is! Map<String, dynamic>) return null;
    return decoded;
  }

  void dispose() => _client.close();
}

class ReportSubmissionException implements Exception {
  const ReportSubmissionException(this.message);

  final String message;

  @override
  String toString() => message;
}
