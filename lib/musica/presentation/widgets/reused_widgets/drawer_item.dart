// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';

class DrawerItem extends StatelessWidget {
  final Widget image;
  final String text;
  final Widget preSpacing;
  final Widget midSpacing;
  final onTapped;

  const DrawerItem(
      {super.key,
      required this.image,
      required this.text,
      required this.preSpacing,
      required this.midSpacing,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 50,
        width: 400,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            preSpacing,
            image,
            midSpacing,
            Text(
              text,
              style: mediumWhiteTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
