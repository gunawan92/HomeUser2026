# Required Reference Documents

The following documents are still required for a production-ready rewrite. No
missing product or backend detail is inferred in implementation.

- STELA UI Component Guide — Home User Draft V2
- BRD STELA Checkout Bundel Pembayaran
- PRD STELA Checkout dan Pembayaran Bundel
- Payment V2 API contract and concrete response schemas (endpoint payloads,
  validation errors, and server-authoritative preview/confirmation behaviour)
- Existing SNAP API documentation
- Existing database documentation
- Formal Payment V2 documentation signed off by product and backend
- STELA Indonesia brand guideline

The legacy frontend architecture and dependency audit were read from
`legacy_reference.bak/docs/`; they are reference material, not the new source
of truth.

The current Payment V2 UI/UX brief is captured in
`docs/product/payment-v2-ui-ux.md`. It is sufficient for mock presentation
work only and does not replace the required API contract.

The minimum Flutter metadata required from the current Payment V1 endpoints is
documented in `docs/api/payment-v1-required-metadata.md` for backend alignment.
