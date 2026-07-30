# Landing Page

## Status

Implemented as the first post-login page. The current login screen opens it
only for UI review until authentication is connected.

## Composition

- STELA logo and top actions for notification and account.
- Greeting and concise product message.
- Payment banner that opens `/payment`.
- A single prominent payment entry card.
- An informational card that supports the payment flow.

Only `Pembayaran` is shown or navigable. Non-payment modules are deliberately
hidden until their own product and implementation work starts.

## Asset policy

New UI code does not import from `legacy_reference.bak/`. Selected image files
are copied into the active `assets/branding/` and `assets/home/` folders and
declared in `pubspec.yaml`. Material icons remain the default for interactive
chrome.
