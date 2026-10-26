class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.whistleblower.mw',
  );
  static const requestOrigin = String.fromEnvironment(
    'API_REQUEST_ORIGIN',
    defaultValue: 'https://www.whistleblower.mw',
  );

  static Uri get organizationsUri =>
      Uri.parse(baseUrl).resolve('/api/organizations');
  static Uri get reportsUri => Uri.parse(baseUrl).resolve('/api/reports');
}
