import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/measure.dart';
import 'package:musica/models/music_model.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/glass_player_card.dart';
import 'package:musica/reusables/widgets/glassmorphism.dart';
import 'package:musica/reusables/widgets/music_card_widget.dart';
import 'package:musica/reusables/widgets/my_collections_widget.dart';
import 'package:http/http.dart' as http;

class CollectionDetailsPage extends StatefulWidget {
  const CollectionDetailsPage({Key? key}) : super(key: key);

  @override
  State<CollectionDetailsPage> createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration position = const Duration(seconds: 0);
  Duration duration = const Duration(seconds: 0);

  playMusic() async {
    await audioPlayer.play(UrlSource('https://developers.deezer.com/%22https://www.deezer.com/track/3135553/%22'));
    setState(() {
      isPlaying = true;
    });
  }

  pauseMusic() async {
    await audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }
  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Music> musicList = [
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
      Music(
        name: 'Music Name',
        artist: 'Artist Name',
        image: Assets.imagesRectangle04,
        duration: '3:00',
      ),
    ];
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: const GlassPlayerCard(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: textColor,
              size: 30,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          Assets.iconsMusicicon,
          height: 25,
          width: 25,
        ),
      ),
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Assets.imagesSampleCollection,
                  ),
                ),
              ),
              height: height,
            ),
            Container(
              height: height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  backgroundColor,
                  Colors.transparent.withOpacity(0.5),
                ],
                stops: const [0.5, 0.9],
              )),
            ),
            Positioned.fill(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  MeasureSize(
                    onChange: (size) {
                      var myChildSize = Size.zero;
                      setState(() {
                        myChildSize = size;
                      });
                      print(myChildSize);
                    },
                    child: Column(
                      children: [
                        // Center(child: MyCollectionsCard(onTap: () {})),
                        const Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            'Tomorrows Tune\'s',
                            style: TextStyle(
                                color: Color(0xffa4c7c6), fontSize: 25),
                          ),
                        ),
                        addVerticalSpacing(10),
                        const Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            'Lorem ipsum dolor sit amet\nConsecrate disciplining elite ut aliquam,\nPurus sit amet luctus venenatis',
                            style: TextStyle(
                                color: Color(0xffa4c7c6), fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  child: Image.asset(
                                Assets.iconsPlayAllIcon,
                                height: 36,
                              )),
                              addHorizontalSpacing(5),
                              Expanded(
                                  child: Image.asset(
                                Assets.iconsAddToCollecIcon,
                                height: 36,
                              )),
                              addHorizontalSpacing(5),
                              Expanded(
                                  child: Image.asset(
                                Assets.iconsLikeIcon,
                                height: 36,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height - 550,
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: musicList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return MusicCardWidget(
                            name: musicList[index].name,
                            artist: musicList[index].artist,
                            image: musicList[index].image,
                            duration: musicList[index].duration);
                      },
                    ),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
