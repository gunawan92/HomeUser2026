# ADR-004: Local persistence

## Status

Accepted

## Context

The application needs cache-first reads and recoverable cart drafts.

## Decision

Use Drift as the single structured local database, Secure Storage for secrets,
and Shared Preferences for simple non-sensitive preferences.

## Consequences

No Hive, Isar, or second SQLite abstraction is introduced.

## Alternatives

Multiple feature-specific local stores.

## Risks

Schema migrations must be tested before releases.
