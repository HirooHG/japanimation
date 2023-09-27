
import 'package:flutter/material.dart';
import 'package:japanimationbloc/common/extensions/list_ext.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/view/update/bloc/chips_cubit.dart';
import 'package:japanimationbloc/view/update/widgets/chips_bar/chips.dart';

class ChipsBar extends StatelessWidget {
  const ChipsBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.padding32.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: TypeOptions
          .values
          .toWidgets((e) => Chips(opt: e)
        ).toList()
      ),
    );
  }
}
