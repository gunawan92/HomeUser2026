# Dependency Register

Reviewed: 2026-07-30. Versions are resolved by Flutter stable 3.44.8.

| Package | Purpose | Owner | Risk / status | Decision |
| --- | --- | --- | --- | --- |
| flutter_riverpod | Feature state and DI | Frontend | Maintained | Single state-management solution. |
| go_router | Declarative routing | Frontend | Maintained | Central route ownership. |
| dio | HTTP client | Core | Maintained | Single network client. |
| json_annotation / json_serializable | DTO serialization | Core | Maintained | Use only with concrete contracts. |
| intl | Currency/date formatting | Design system | Maintained | Locale-aware presentation. |
| google_fonts | Montserrat delivery | Design system | Network/font availability | STELA brand typography. |
| flutter_secure_storage | Tokens/secrets | Core | Platform-sensitive | Sensitive session storage only. |
| shared_preferences | Simple preferences | Core | Low | Never stores tokens. |
| drift / drift_flutter / drift_dev | Structured local cache and drafts | Core | Migration discipline required | Single local database. |
| path / path_provider | Database paths | Core | Low | Drift support. |
| collection / uuid | Collection helpers / idempotency client key | Core | Low | Scoped utility use. |
| connectivity_plus | Connectivity state | Core | Connectivity is not reachability | Offline/degraded UX only. |
| build_runner / mocktail | Generation/testing | Frontend | Dev only | Required tooling. |

## Deferred

`freezed` is intentionally deferred. The compatible resolver option for the
current Drift/JSON generator stack is prerelease, which violates the supported
baseline policy. It will be reconsidered only when a stable compatible release
is available or the generator stack is revised with approval.

## Rejected for baseline

Firebase, scanner, WebView, PDF, ads, downloader, media, picker packages,
GetX, Bloc, Hive, Isar, and legacy SQLite packages are excluded because they
are not required for Payment V2 foundation.
