
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:japanimationbloc/config/nav/routes.dart';

class CustBottomBar extends StatelessWidget {
  const CustBottomBar({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: (state.uri.path == Routes.home.getPath()) 
        ? Routes.home.index 
        : Routes.update.index,
      onTap: (value) {
        if(value == Routes.home.index) {
          GoRouter.of(context).go(Routes.home.getPath());
        } else {
          GoRouter.of(context).go(Routes.update.getPath());
        }
      },
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: Routes.home.name,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.add),
          label: Routes.update.name,
        ),
      ]
    );
  }
}
