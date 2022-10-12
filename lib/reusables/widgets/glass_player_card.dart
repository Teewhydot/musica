
import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/glassmorphism.dart';

class GlassPlayerCard extends StatefulWidget {
  const GlassPlayerCard({Key? key}) : super(key: key);

  @override
  State<GlassPlayerCard> createState() => _GlassPlayerCardState();
}

class _GlassPlayerCardState extends State<GlassPlayerCard> {
  @override
  Widget build(BuildContext context) {
    return GlassMorphicContainer(
        500.0,
        100.0,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addHorizontalSpacing(10),
                Column(
                  children: [
                    addVerticalSpacing(15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Assets.imagesJames,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                ),
                addHorizontalSpacing(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Seasons in', style: mediumWhiteTextStyle),
                    Text('James',
                        style:
                        smallWhiteTextStyle.copyWith(color: textColor)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                    },
                    child: Icon(Icons.pause, color: textColor)),
                addHorizontalSpacing(10),
                GestureDetector(
                    onTap: () async {
                    },
                    child: Image.asset(Assets.iconsPlaymusic)),
                addHorizontalSpacing(10),
                Icon(Icons.skip_next, color: textColor),
                addHorizontalSpacing(30),
              ],
            ),
          ],
        ));
  }
}
