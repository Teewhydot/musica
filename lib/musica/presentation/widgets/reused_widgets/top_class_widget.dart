// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';

class TopClassWidget extends StatelessWidget {
  final title;
  final artistName;
  final image;
  final time;

  const TopClassWidget(
      {super.key,
      required this.title,
      required this.artistName,
      required this.image,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 233,
        width: 323,
        decoration: BoxDecoration(
          color: topClassWidgetColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    image,
                    height: 99,
                    width: 108,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    Assets.imagesHeartTopClass,
                    height: 37,
                    width: 37,
                  ),
                ],
              ),
              addVerticalSpacing(20),
              Text(
                title,
                style: smallWhiteTextStyle.copyWith(fontSize: 17),
              ),
              addVerticalSpacing(10),
              Text(artistName,
                  style: smallWhiteTextStyle.copyWith(color: textColor)),
              addVerticalSpacing(30),
              Text(time, style: smallWhiteTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
