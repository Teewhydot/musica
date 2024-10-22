import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: textColor,
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Image.asset(
        Assets.iconsMusicicon,
        height: 25,
        width: 25,
      ),
    );
  }
}
