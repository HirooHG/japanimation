
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/config/nav/routes.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';

class ThingsList extends StatelessWidget {
  const ThingsList({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        if(appState is AppLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: appState.advs.length,
              itemBuilder: (context, index) {
                final adv = appState.advs[index];
                return Card(
                  margin: Paddings.padding8.withoutLeft,
                  color: Theme.of(context).colorScheme.onSurface,
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed(Routes.thing.getPath(), extra: adv);
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        color: Theme.of(context).colorScheme.surface
                      )
                    ),
                    title: Text(
                      adv.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.surface
                      ),
                    ),
                  ),
                );
              }
            )
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
              child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onBackground),
            )
         ],
        );
      }
    );
  }
}
