/// Authentication redirects will be added when the approved session contract is
/// implemented. No route assumes an unaudited legacy session.
abstract final class RouteGuards {
  static bool requiresAuthenticatedSession(String location) =>
      location.startsWith('/payment');
}
