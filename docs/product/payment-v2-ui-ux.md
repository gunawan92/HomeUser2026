# Payment V2 UI/UX Scope

## Status

Children and bills are loaded from the LAN development API after login. Cart,
checkout, payment request, and payment summary remain to be integrated.

## Scope and safety rules

- The user is an OTM (parent) and can see all of their children.
- A payment draft can bundle items from multiple children.
- The cart and invoice must identify the child, school, class, and period for
  every selected item.
- Flutter never creates `transidmerchant`, `transidstela`, bill IDs, provider
  identifiers, or authoritative totals.

## Information hierarchy

`Anak -> Tahun ajaran -> Kelas -> Jenis pembayaran -> Item tagihan`

The visual treatment uses a child card, then lighter period/class context,
followed by separate `SPP` and `Pembayaran Lainnya` sections. It must not use a
dense stack of indistinguishable nested cards.

## Payment item model

An item has the conceptual fields below. `amount` is an integer in IDR.

```text
idschool, idclass, serial, periode, jenisPembayaran,
referenceTambahan?, title, description?, dueDate?, amount,
status, isSelectable, disabledReason?
```

There is no client-generated `bill_id`.

## Draft, invoice, and payment progression

1. Select available items for one or more children.
2. Inspect the draft/cart: child, school, group, period/class, items, and
   subtotal. The draft has no provider fee.
3. Request a server preview when the API contract is implemented.
4. Select a payment method based on the server-authoritative preview.
5. Confirm online only. Backend creates transaction and provider identifiers.

Mock-only method examples for later invoice UI: VA fee Rp4.000, QRIS fee 1.2%,
and Alfamart fee Rp6.500. QRIS rounding is not assumed by Flutter and must be
returned by the backend.

## Current mock fixtures

| Child | School / class | Items |
| --- | --- | --- |
| Sela Anindya (`DEMO20`) | SMP Demo STELA / VII A | SPP July available, SPP August pending, Daftar Ulang available, Kegiatan Renang paid |
| Raka Pratama (`DEMO21`) | SD Demo STELA / IV B | SPP July available, Buku Paket unavailable |

## Deliberately out of scope

- Direct DOKU or SNAP integration.
- Paid-status optimism.
- Offline payment confirmation.
