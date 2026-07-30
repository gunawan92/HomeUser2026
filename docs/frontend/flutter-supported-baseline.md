# STELA Supported Baseline

- Flutter: `3.44.8` stable
- Dart: `3.12.2` (bundled with Flutter)
- Java: Temurin `17.0.18`
- Android Gradle Plugin / Kotlin / SDK levels: generated Flutter baseline;
  record exact values after the first Android build.
- iOS baseline: generated Flutter baseline; validate with Xcode in CI/macOS.

## Policy

Flutter remains on stable channel only. Patch upgrades are evaluated monthly;
stable release upgrades require CI, Android debug build, and rollback to the
previous FVM version. `.fvmrc` pins the intended SDK for local/CI use without
forcing a global installation.
