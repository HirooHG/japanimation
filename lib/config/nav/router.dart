import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:japanimationbloc/config/nav/context_keys.dart';
import 'package:japanimationbloc/config/nav/routes.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/view/update/update_page.dart';
import 'package:japanimationbloc/view/home/home_page.dart';
import 'package:japanimationbloc/view/nav/cust_app_bar.dart';
import 'package:japanimationbloc/view/nav/cust_bottom_navbar.dart';
import 'package:japanimationbloc/view/thing/thing_page.dart';

const String title = "Japanimation";

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home.getPath(),
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, body) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Sizes.size64.size),
            child: const CustAppBar(title: title)
          ),
          body: body,
          bottomNavigationBar: CustBottomBar(state: state),
        );
      },
      routes: [
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          path: Routes.home.getPath(),
          name: Routes.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: Routes.thing.getPath(),
              name: Routes.thing.name,
              builder: (context, state) => ThingPage(adv: state.extra as Advertisement)
            ),
          ]
        ),
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          path: Routes.update.getPath(),
          name: Routes.update.name,
          builder: (context, state) => const UpdatePage()
        ),
      ]
    ),
  ]
);
