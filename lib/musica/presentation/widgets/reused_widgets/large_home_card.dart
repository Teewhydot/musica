import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';

class LargeHomeCardWidget extends StatelessWidget {
  const LargeHomeCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 503,
        width: 367,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(Assets.imagesPlaylistImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpacing(20),
              const Text(
                'Curated Playlist',
                style: mediumWhiteTextStyle,
              ),
              addVerticalSpacing(236),
              const Text(
                'R & B  Hits',
                style: boldWhiteTextStyle,
              ),
              addVerticalSpacing(20),
              Text(
                'All mine, Lie again, Petty call me everyday,Out of time, No love, Bad habit,and so much more',
                style: smallWhiteTextStyle.copyWith(fontSize: 14),
              ),
              addVerticalSpacing(40),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                      ),
                      Positioned(
                        left: 25,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Positioned(
                        left: 100,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.yellow,
                        ),
                      ),

                      // Container(
                      //   height: 50,
                      //   width: 50,
                      //   decoration: const BoxDecoration(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(20)),
                      //     image: DecorationImage(
                      //       image: AssetImage(Assets.imagesPlaylistImage),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   top: 0,
                      //   right: 0,
                      //   child: Container(
                      //     height: 20,
                      //     width: 20,
                      //     decoration: const BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20)),
                      //     ),
                      //     child: const Icon(
                      //       Icons.play_arrow,
                      //       color: Colors.black,
                      //       size: 15,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  addHorizontalSpacing(140),
                  Image.asset(
                    Assets.iconsHeartIcon,
                    height: 36,
                    width: 36,
                  ),
                  addHorizontalSpacing(10),
                  Text(
                    '33k Likes',
                    style: smallWhiteTextStyle.copyWith(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
