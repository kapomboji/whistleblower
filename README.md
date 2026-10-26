# whistleblowerltd

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Reporting API

The report flow submits a multipart `POST /api/reports` request, including any
evidence attachments. The app connects to `https://api.whistleblower.mw` by
default. For local development, start the API from its workspace folder with
`npm run dev` and override the API URL with `--dart-define=API_BASE_URL=...`
(for an Android emulator, use `http://10.0.2.2:4000`; for desktop or iOS
simulators, use `http://localhost:4000`).

The app sends the configured website origin because the API requires an
allowlisted `Origin` on state-changing requests. The default is
`https://whistleblower.mw`; for local development, set
`API_REQUEST_ORIGIN` to an origin included in the API's `CORS_ORIGINS`.

To use a different API or website origin, pass these values when running or
building the app:

```text
--dart-define=API_BASE_URL=https://api.whistleblower.mw
--dart-define=API_REQUEST_ORIGIN=https://whistleblower.mw
```

The API currently accepts up to 10 attachments per report, with a 10 MB limit
per file.
