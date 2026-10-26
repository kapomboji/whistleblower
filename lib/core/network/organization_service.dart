import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_config.dart';

class OrganizationService {
  OrganizationService({http.Client? client})
    : _client = client ?? http.Client();

  static const _requestTimeout = Duration(seconds: 15);

  final http.Client _client;

  Future<List<String>> fetchOrganizations() async {
    final response = await _client
        .get(ApiConfig.organizationsUri)
        .timeout(_requestTimeout);

    if (response.statusCode != 200) {
      throw OrganizationServiceException(
        'The organizations could not be loaded (HTTP ${response.statusCode}).',
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic> || decoded['organizations'] is! List) {
      throw const OrganizationServiceException(
        'The organizations response from the API was invalid.',
      );
    }

    final organizations =
        (decoded['organizations'] as List)
            .whereType<Map<String, dynamic>>()
            .map((organization) => organization['name'])
            .whereType<String>()
            .map((name) => name.trim())
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList()
          ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    return organizations;
  }

  void dispose() => _client.close();
}

class OrganizationServiceException implements Exception {
  const OrganizationServiceException(this.message);

  final String message;

  @override
  String toString() => message;
}
