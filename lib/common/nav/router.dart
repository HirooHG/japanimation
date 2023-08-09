import 'package:go_router/go_router.dart';
import 'package:japanimationbloc/common/nav/routes.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: Routes.home.getPath(),
      name: Routes.home.name,
    ),
    GoRoute(
      path: Routes.add.getPath(),
      name: Routes.add.name,
    ),
    GoRoute(
      path: Routes.thing.getPath(),
      name: Routes.thing.name,
    ),
    GoRoute(
      path: Routes.things.getPath(),
      name: Routes.things.name,
    )
  ]
);
