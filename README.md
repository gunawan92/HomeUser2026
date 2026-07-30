# STELA Indonesia

Flutter rewrite for STELA Indonesia. Legacy source is preserved under
`legacy_reference.bak/` for business and visual reference only; new code lives
in `lib/` and must never import that backup.

## Baseline

- Flutter 3.44.8 stable, pinned in `.fvmrc`
- Material 3 with the STELA design system
- Riverpod, GoRouter, Dio, Secure Storage, Drift, and current supported
  dependencies only
- Android/iOS application identity: `com.ndisolution.bigstela`

## Local development

```powershell
flutter pub get
flutter analyze
flutter test
flutter run -d <android-device-id>
```

The development API base URL is `http://192.168.1.71:8081`. Android cleartext
HTTP is enabled for this LAN-only development environment; production must use
HTTPS. Login uses `/token_create` and `/profil_user` and stores the session in
Secure Storage.

## Current product surface

- Login UI and STELA landing page are available for visual review.
- Payment V2 loads children and bills from the development API after login and
  supports bundled child drafts.
- Backend calls, provider payment, and non-payment feature modules are not yet
  implemented.

See [documentation](docs/) for architectural decisions, API flow, and product
scope.
