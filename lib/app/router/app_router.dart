import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/login_page.dart';
import '../../features/home/presentation/stela_landing_page.dart';
import '../../features/payment/presentation/pages/parent_children_payment_page.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.home,
      builder: (context, state) => const StelaLandingPage(),
    ),
    GoRoute(
      path: '/login',
      name: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/payment',
      name: RouteNames.payment,
      builder: (context, state) => const ParentChildrenPaymentPage(),
    ),
  ],
);
