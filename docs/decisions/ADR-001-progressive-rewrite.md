# ADR-001: Progressive rewrite

## Status

Accepted

## Context

The legacy Flutter application cannot be safely refactored in place.

## Decision

Preserve it in `legacy_reference.bak/` and build a new application at root.

## Consequences

Legacy code is reference-only and never imported by the new source set.

## Alternatives

Continue patching the legacy source.

## Risks

Feature parity is delivered progressively.
