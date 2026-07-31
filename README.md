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

The staging API base URL is `https://dev.stela.id`. All Flutter API traffic
uses HTTPS. Login uses `/token_create` and `/profil_user`; `profile.serial` is
stored as the parent reference in Secure Storage.

## Current product surface

- Login UI and STELA landing page are available for visual review.
- Payment V1 loads children, bills, cart, checkout, channel options, and
  payment instructions from the staging API after login.

See [documentation](docs/) for architectural decisions, API flow, and product
scope.
