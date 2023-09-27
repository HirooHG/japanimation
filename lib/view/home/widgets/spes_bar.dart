
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/view/home/bloc/spe_cubit.dart';

class SpesBar extends StatefulWidget {
  const SpesBar({
    super.key
  });

  @override
  State<SpesBar> createState() {
    return _SpesBarState();
  }
}

class _SpesBarState extends State<SpesBar> {

  final double rotatedAngle = 3.1;
  final double notRotatedAngle = 0;

  final sizeToggled = Sizes.size128.size;
  final sizeNotToggled = Sizes.size48.size;

  bool isToggled = false;
  late double size = sizeNotToggled;
  late double angle = notRotatedAngle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: size,
      duration: const Duration(milliseconds: 500),
      margin: Paddings.padding8.withoutLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Sizes.size12.size),
          bottomRight: Radius.circular(Sizes.size12.size)
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.primary,
            child: Transform.rotate(
              angle: angle,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    angle = isToggled ? notRotatedAngle : rotatedAngle;
                    size = isToggled ? sizeNotToggled : sizeToggled;
                    isToggled = !isToggled;
                  });
                },
                icon: Icon(Icons.arrow_forward_ios, size: Sizes.size16.size, color: Colors.white)
              ),
            ),
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, appState) {
              if(appState is AppLoaded) {
                return Expanded(
                  child: ListView(
                    children: appState.spes.map((e) => 
                      BlocBuilder<SpeCubit, Spe?>(
                        builder: (context, spe) {
                          return GestureDetector(
                            onTap: () {
                              Spe? selectedSpe = e != spe ? e : null;

                              BlocProvider.of<SpeCubit>(context).change(selectedSpe);

                              BlocProvider.of<AppBloc>(context).add(SelectSpe(spe: selectedSpe));
                            },
                            child: Container(
                              margin: Paddings.padding4.all,
                              decoration: BoxDecoration(
                                color: spe == e
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: SizedBox(
                                height: Sizes.size32.size,
                                child: Center(
                                  child: isToggled
                                    ? Text(
                                      e.name,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                    : Icon(
                                      Icons.arrow_forward,
                                      size: Sizes.size16.size,
                                      color: Theme.of(context).colorScheme.onBackground,
                                    ),
                                )
                              ),
                            ),
                          );
                        }
                      )
                    ).toList(),
                  )
                );
              }

              return Container();
            }
          )
        ],
      ),
    );
  }
}
