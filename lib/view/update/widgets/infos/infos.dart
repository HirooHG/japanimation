
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/view/update/bloc/chips_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/update_options_cubit.dart';
import 'package:japanimationbloc/view/update/widgets/infos/drop_down_entity_category.dart';
import 'package:japanimationbloc/view/update/widgets/infos/drop_down_entity_spe.dart';
import 'package:japanimationbloc/view/update/widgets/infos/name_textfield.dart';

class Infos extends StatelessWidget {
  const Infos({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<UpdateOptionsCubit, UpdateOptions>(
          builder: (context, opt) {
            return BlocBuilder<ChipsCubit, TypeOptions>(
              builder: (context, type) {
                final bool isNameVisible = type == TypeOptions.advertisement
                  || (type == TypeOptions.category && opt != UpdateOptions.delete)
                  || (type == TypeOptions.spe && opt != UpdateOptions.delete);

                final bool isDPCatVisible = type == TypeOptions.advertisement
                  || (type == TypeOptions.category && (opt == UpdateOptions.modify || opt == UpdateOptions.delete));
                final bool isDPSpeVisible = type == TypeOptions.advertisement
                  || (type == TypeOptions.spe && (opt == UpdateOptions.modify || opt == UpdateOptions.delete));

                return Column(
                  children: [
                    if(isNameVisible) const NameTextField(),
                    if(isDPCatVisible) const DropDownEntityCategory(),
                    if(isDPSpeVisible) const DropDownEntitySpe(),
                  ],
                );
              }
            );
          }
        ),
      )
    );
  }
}
