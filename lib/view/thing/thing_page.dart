
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/view/thing/widgets/buttons_thing.dart';
import 'package:japanimationbloc/view/thing/widgets/infos_thing.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_cat_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_spe_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/name_cubit.dart';

class ThingPage extends StatelessWidget {
  const ThingPage({
    super.key,
    required this.adv
  });

  final Advertisement adv;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NameCubit()
            ..change(adv.name),
        ),
        BlocProvider(
          create: (_) => DropDownCatCubit()
            ..change(adv.category),
        ),
        BlocProvider(
          create: (_) => DropDownSpeCubit()
            ..change(adv.spe),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            adv.name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Container(
          padding: Paddings.padding12.all,
          child: Column(
            children: [
              const InfosThing(),
              ButtonsThing(adv: adv)
            ],
          ),
        ),
      )
    );
  }
}
