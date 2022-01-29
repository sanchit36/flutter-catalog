import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/widgets/themes.dart';

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBlueColor).make(),
        "Treading Products".text.xl2.make(),
      ],
    );
  }
}
