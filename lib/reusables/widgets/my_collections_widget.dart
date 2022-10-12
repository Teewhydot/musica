// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';

class MyCollectionsCard extends StatelessWidget {
 final onTap;
 final imageUrl;
 final title;
  final artistName;
  final fans;

  const MyCollectionsCard({super.key, required this.onTap,required this.imageUrl,required this.title,required this.artistName,required this.fans});

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
              image:  DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 234,
            width: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [

                    Colors.transparent.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  // stops: const [0.1, 0.1],
                )),
          ),
          Positioned(
              top: 130,
              left: 10,
              child: Text(
                title,
                style: smallWhiteTextStyle.copyWith(fontSize: 25),
              )),
          Positioned(
              top: 160,
              left: 10,
              child: Text(
                artistName,
                style: smallWhiteTextStyle.copyWith(color: textColor),
              )),
          Positioned(
            top: 155,
            right: 40,
            child: Image.asset(
              Assets.iconsMyCollectionsPlayIcon,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
           Positioned(
            top: 190,
            left: 10,
            child: Text(
              '$fans Likes',
              style: smallWhiteTextStyle,
            ),
          ),
        ]),
      ),
    );
  }
}
