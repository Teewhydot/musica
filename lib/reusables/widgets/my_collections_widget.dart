// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';

class MyCollectionsCard extends StatelessWidget {
 final onTap;

  const MyCollectionsCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            height: 234,
            width: 360,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesRectangle02),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 130,
              left: 10,
              child: Text(
                'Limits',
                style: smallWhiteTextStyle.copyWith(fontSize: 25),
              )),
          Positioned(
              top: 160,
              left: 10,
              child: Text(
                'BTS',
                style: smallWhiteTextStyle.copyWith(color: textColor),
              )),
          Positioned(
            top: 155,
            right: 10,
            child: Image.asset(
              Assets.iconsMyCollectionsPlayIcon,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 190,
            left: 10,
            child: Text(
              '2.3m Likes',
              style: smallWhiteTextStyle,
            ),
          ),
        ]),
      ),
    );
  }
}