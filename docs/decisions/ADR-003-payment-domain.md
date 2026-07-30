# ADR-003: Payment domain safety

## Status

Accepted

## Context

Payment identifiers and final monetary values are server-owned.

## Decision

Flutter uses integer IDR for display and drafts only; it never creates bill IDs,
`transidmerchant`, or `transidstela`.

## Consequences

Final checkout and fee calculation remain online backend operations.

## Alternatives

Client-generated payment identifiers or client-authoritative totals.

## Risks

Offline mode cannot confirm a payment.
