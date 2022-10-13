import 'package:flutter/material.dart';
import 'package:musica/reusables/constants.dart';

class MusicCardWidget extends StatelessWidget {
  final String name;
  final String artist;
  final int duration;

  const MusicCardWidget({super.key, required this.name, required this.artist,required this.duration});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 70.0;
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Image.asset(Asset,height: 39,width: 39,),
                addHorizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpacing(10),
                    Text(
                      name,
                      style:mediumWhiteTextStyle.copyWith(fontSize: 20),
                    ),
                    addVerticalSpacing(5),
                    Text(
                      artist,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
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
    );
  }
}
