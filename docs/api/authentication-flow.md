# Authentication Flow

## Status

Implemented against the staging API. Credentials are sent only when the
user submits the login form and the resulting session is persisted securely.

## Approved legacy-compatible flow for implementation

Base URL: `https://dev.stela.id`.

1. `POST /token_create` with `user_name`, `password`, `remember=1`, and
   `app_name=SNM`.
2. Persist only the required session values, including `user_name` and
   `token_key`, in Secure Storage.
3. `POST /profil_user` with `user_name` and `token_key`.
4. Use `profile.serial` as `parent_reference`.
5. `GET /api/v1/parents/{profile.serial}/students`.

`parent_reference` is **not** `nik_ortu` and is not `parent_name`. The profile
response is the authority for the value through its `serial` field.

For Payment V1, each child response must use `student_reference` as the
canonical child identifier. Flutter passes that exact value to
`GET /api/v1/students/{student_reference}/bills`; it does not derive or create
another identifier.

## Security and UX requirements

- Never write tokens to Shared Preferences, logs, analytics, or URL query
  parameters.
- Clear Secure Storage on explicit sign-out or an invalid-session response.
- Login failure must show a safe user-facing message and must not expose raw
  server errors or credentials.
- Protected routes will be guarded only after real session restoration is
  implemented.
