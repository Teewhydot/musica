// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';

class MusicCardWidget extends StatelessWidget {
  final String name;
  final String artist;
  final int duration;
  final String trackLink;
  final onTapped;

  const MusicCardWidget(
      {super.key,
      required this.name,
      required this.artist,
      required this.duration,
      required this.trackLink,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 100.0;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                softWrap: false,
                                style:
                                    mediumWhiteTextStyle.copyWith(fontSize: 20),
                              ),
                            ),
                            addVerticalSpacing(5),
                            Expanded(
                              child: Text(
                                artist,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: textColor,
                        size: 30,
                      ),
                    ),
                    Text(duration.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
