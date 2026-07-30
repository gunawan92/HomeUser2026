# ADR-005: Online payment safety

## Status

Accepted

## Context

Payment confirmation requires locking, idempotency, and provider interaction.

## Decision

Confirmation is online-only and fail-closed. Offline users may manage local
drafts and inspect cached data only.

## Consequences

The UI never shows optimistic paid status.

## Alternatives

Queueing or simulating payment creation offline.

## Risks

Users need connectivity to confirm payment.
