# ADR-002: Flutter baseline

## Status

Accepted

## Context

The project requires a repeatable supported toolchain.

## Decision

Use Flutter 3.44.8 stable and Dart 3.12.2, pinned in `.fvmrc`.

## Consequences

No beta, dev, master, or prerelease Flutter SDK is used.

## Alternatives

Unpinned global Flutter installation.

## Risks

FVM must be installed in CI/local environments to enforce the pin.
