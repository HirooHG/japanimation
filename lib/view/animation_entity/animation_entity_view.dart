import 'package:flutter/material.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/form_fields.dart';

import 'package:japanimationbloc/view/animation_entity/widgets/general_infos.dart';
import 'package:japanimationbloc/view/animation_entity/widgets/header_name.dart';

class AnimationEntityView extends StatelessWidget {
  const AnimationEntityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: const Color(0xFF1a1a1a),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderName(),
                const GeneralInfos(),
                FormFields(),
              ],
            )),
      ),
    );
  }
}
