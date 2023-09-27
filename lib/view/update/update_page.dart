
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/view/update/bloc/chips_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_cat_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_spe_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/name_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/update_options_cubit.dart';
import 'package:japanimationbloc/view/update/widgets/chips_bar/chips_bar.dart';
import 'package:japanimationbloc/view/update/widgets/chips_bar/update_chips_bar.dart';
import 'package:japanimationbloc/view/update/widgets/infos/infos.dart';
import 'package:japanimationbloc/view/update/widgets/submit_button.dart';
import 'package:japanimationbloc/view/update/widgets/title_widget.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChipsCubit()
        ),
        BlocProvider(
          create: (_) => UpdateOptionsCubit()
        ),
        BlocProvider(
          create: (_) => DropDownCatCubit()
        ),
        BlocProvider(
          create: (_) => DropDownSpeCubit()
        ),
        BlocProvider(
          create: (_) => NameCubit()
        )
      ],
      child: Container(
        padding: Paddings.padding16.all,
        child: Column(
          children: [
            const TitleWidget(),
            const ChipsBar(),
            const Infos(),
            BlocBuilder<ChipsCubit, TypeOptions>(
              builder: (context, type) {
                if(type != TypeOptions.advertisement) {
                  return const UpdateChipsBar();
                }

                return Container();
              }
            ),
            const SubmitButton()
          ],
        ),
      )
    );
  }
}
