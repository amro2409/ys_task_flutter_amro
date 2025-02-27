import 'package:go_router/go_router.dart';
import 'package:stock_market_tracker/src/core/routing/route_names.dart';
import 'package:stock_market_tracker/src/presentation/screens/stock/home_screen.dart';

class AppRouter {


  late final GoRouter router = GoRouter(routes: <GoRoute>[
    // Auth
    // GoRoute(
    //   path: RouteNames.login,
    //   builder: (context, state) => LoginPage(),
    // ),
    // GoRoute(
    //   path: RouteNames.register,
    //   builder: (context, state) => const RegisterPage(),
    // ),


    GoRoute(
      path: RouteNames.root,
      name: 'home-stock',
      builder: (context, state) => const HomeScreen(),
      // redirect: (context, state) => _authGuard(context),
      routes: [
        // Stock Module
        GoRoute(
          name: RouteNames.stockCreate,
          path: 'stock-create',
          builder: (context, state) => const HomeScreen(),
        ),
        // Stock Module
        GoRoute(
          name: RouteNames.stockDetails,
          path: 'stock-details',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    ),
  ]);
}
