
import 'package:flutter/material.dart';
import 'package:japanimationbloc/common/extensions/list_ext.dart';
import 'package:japanimationbloc/config/size_preferences/paddings.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';
import 'package:japanimationbloc/view/update/bloc/update_options_cubit.dart';
import 'package:japanimationbloc/view/update/widgets/chips_bar/update_option_chips.dart';

class UpdateChipsBar extends StatelessWidget {
  const UpdateChipsBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.padding32.vertical,
      height: Sizes.size32.size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: UpdateOptions
          .values
          .toWidgets((e) => UpdateOptionsChips(opt: e)
        ).toList()
      ),
    );
  }
}
