import 'package:flutter/material.dart';

import 'package:japanimationbloc/view/update/widgets/infos/drop_down_entity_category.dart';
import 'package:japanimationbloc/view/update/widgets/infos/drop_down_entity_spe.dart';
import 'package:japanimationbloc/view/update/widgets/infos/name_textfield.dart';
import 'package:japanimationbloc/config/size_preferences/sizes.dart';

class InfosThing extends StatelessWidget {
  const InfosThing({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NameTextField(),
          SizedBox(height: Sizes.size32.size),
          const DropDownEntitySpe(),
          const DropDownEntityCategory(),
        ],
      )
    );
  }
}
