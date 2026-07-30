class AuthSession {
  const AuthSession({
    required this.userName,
    required this.tokenKey,
    required this.parentReference,
    this.displayName,
    this.schoolName,
  });

  final String userName;
  final String tokenKey;
  final String parentReference;
  final String? displayName;
  final String? schoolName;
}
