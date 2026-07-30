# Preflight Report — Progressive Rewrite

- Date: 2026-07-30 (Asia/Bangkok)
- Working directory: `C:\xampp\htdocs\flutter\bigstela`
- Git branch / source commit: `main` / `9a568752b5c69d5efd466aecaa9a2103064663de`
- Flutter / Dart: Flutter `3.44.8` stable / Dart `3.12.2`
- Java: Temurin OpenJDK `17.0.18`
- Android SDK: `C:\Users\windows-10\AppData\Local\Android\Sdk`

## Working-tree safety

The source working tree is dirty: 121 modified tracked files and 45 untracked
files (126 entries from `git status --short`). No Git reset, clean, checkout,
or force operation was performed.

Modified files span legacy `lib/` (login, home, payment, classroom, profile,
notifications), Android Gradle/manifest configuration, `pubspec.yaml`,
`pubspec.lock`, `.gitignore`, and `README.md`. Untracked work includes `docs/`
and earlier rewrite attempts under `lib/app/`, `lib/core/`, and `lib/features/`.
All of this is treated as legacy reference and will be preserved before the new
baseline is created.

## Existing project inventory

| Area | File count | Notes |
| --- | ---: | --- |
| `lib/` | 153 | Legacy source plus earlier rewrite attempts. |
| `images/` | 124 | Legacy image assets. |
| `android/` | 28,520 | Includes generated Gradle cache; cache is excluded from backup. |
| `web/` | 7 | Legacy web runner configuration. |
| `test/` | 1 | Legacy test source. |
| `docs/` | 2 before this report | Existing rewrite notes. |

## Legacy dependency risk

The legacy project contains obsolete and broad dependencies, including old
Firebase, scanner, WebView, PDF, notification, ads, and storage integrations.
They will not be carried into the new Flutter baseline.

## Security findings

Sensitive files were found by filename only; their contents were not read or
logged:

- `yudiKeyStore`
- `yudiKeyStore.jks`
- `android/yudiKeyStore`
- `android/app/google-services.json`
- `android/app/src/google-services.json`
- `android/app/src/debug/google-services.json`

Keystores and Firebase configuration will be preserved only in the legacy
reference, excluded from the new Flutter source, and should be reviewed for
rotation before a production release. Generated Gradle documentation mentioning
credentials is not treated as a project credential.

## Initial decision

Migration is safe to continue only as a non-destructive, validated backup.
The source tree must be moved only after file-count and checksum validation.
Generated folders and caches are excluded.
