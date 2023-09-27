
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/common/bloc/app_bloc.dart';
import 'package:japanimationbloc/common/snack_bar/custom_snack_bar.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_cat_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/drop_down_spe_cubit.dart';
import 'package:japanimationbloc/view/update/bloc/name_cubit.dart';
class ButtonsThing extends StatefulWidget {
  const ButtonsThing({
    super.key,
    required this.adv
  });

  final Advertisement adv;

  @override
  State<StatefulWidget> createState() {
    return _ButtonsThingState();
  }
}

class _ButtonsThingState extends State<ButtonsThing> {

  _handleModify(BuildContext context, Category? cat, Spe? spe, String name) {
    Category? finalCat = (cat != widget.adv.category) 
      ? cat
      : widget.adv.category;
    Spe? finalSpe = (spe != widget.adv.spe) 
      ? spe
      : widget.adv.spe;
    String finalName = (name != widget.adv.name) 
      ? name
      : widget.adv.name;

    BlocProvider.of<AppBloc>(context).add(ModifyEntity(entity: Advertisement(
      id: widget.adv.id,
      name: finalName,
      category: finalCat,
      spe: finalSpe
    )));
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size64.size, child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  BlocProvider.of<AppBloc>(context).add(DeleteEntity(entity: widget.adv));
                });
              },
              child: Container(
                margin: Paddings.padding8.horizontal,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.error),
                  borderRadius: BorderRadius.circular(Sizes.size4.size)
                ),
                child: Center(
                  child: Text(
                    "DELETE",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.error
                    )
                  ),
                ),
              ),
            )
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                final Category? cat = BlocProvider.of<DropDownCatCubit>(context).state;
                final Spe? spe = BlocProvider.of<DropDownSpeCubit>(context).state;
                final String name = BlocProvider.of<NameCubit>(context).state;

                if(cat != widget.adv.category || spe != widget.adv.spe || name != widget.adv.name) {
                  _handleModify(context, cat, spe, name);
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const CustomSnackBar.error(
                    content: "Nothing to change"
                  ).buildSnackBar(context)
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(Sizes.size4.size)
                ),
                margin: Paddings.padding8.horizontal,
                child: Center(
                  child: Text(
                    "MODIFY",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary
                    )
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
