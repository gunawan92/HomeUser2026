# Legacy Inventory

The legacy source is preserved under `legacy_reference.bak/` and is reference
only. It is not part of the new Dart source set.

| Area | Legacy location | Migration treatment |
| --- | --- | --- |
| Authentication | `lib/login/`, `lib/lupa/` | Rebuild with secure storage and current API contract. |
| Home / landing | `lib/home/` | Rebuilt as a Material 3 landing page. Only the payment entry point is active; remaining feature entries are visual placeholders. |
| Student / parent | `lib/login/`, `lib/home/` | Derive domain from approved API only. |
| Payment | `lib/home/pembayaran/` | Reference business flow only; replace with Payment V2. |
| Attendance / agenda | `lib/home/absensi/`, `lib/home/agenda/` | Deferred. |
| Notification | `lib/notifikasi/`, `lib/profile/` | Deferred; Firebase is not in new baseline. |
| Classroom / content | `lib/home/kelasku/`, `lib/home/kata*` | Deferred. |
| Marketplace | `lib/home/homeViewKantin.dart` and related assets | Deferred. |
| Profile / settings | `lib/profile/` | Deferred. |
| Networking | `lib/login/model/login_model.dart` | Replace with Dio-only client. |
| Storage | `lib/login/dataBase2.dart` | Replace with Drift plus secure storage. |
| Firebase / ads | Android config and legacy packages | Do not migrate initially. |
| Scanner / PDF / WebView | Legacy dependency and feature sources | Do not migrate initially. |
| Assets | `legacy_reference.bak/assets/` | Curated selections are copied into new `assets/branding/` and `assets/home/`; the backup remains immutable reference material. |
| Credentials / security | Legacy keystores and Firebase JSON | Preserve in backup only; rotate/review before release. |

## Known API reference

Legacy login and payment endpoints are reference material only. New endpoint
contracts, especially Payment V2, must be implemented only after approval and
must never generate server-owned IDs in Flutter.
