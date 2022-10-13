import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/models/music_model.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/custom_app_bar.dart';
import 'package:musica/reusables/widgets/glass_player_card.dart';
import 'package:musica/reusables/widgets/music_card_widget.dart';
import 'package:http/http.dart' as http;

class CollectionDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String artistName;
  final int fans;
  final String trackList;

  const CollectionDetailsPage(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.artistName,
      required this.fans,
      required this.trackList})
      : super(key: key);

  @override
  State<CollectionDetailsPage> createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {
  List<Music> musicList = [];
  late Future trackListFuture;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration position = const Duration(seconds: 0);
  Duration duration = const Duration(seconds: 0);



  Future getTrackList(String apiLink) async {
    http.Response response1 = await http.get(Uri.parse(widget.trackList));
    if (response1.statusCode == 200) {
      var res1 = await jsonDecode(response1.body);
      var res2 = res1['data'];
      for (var data in res2) {
        var trackName = data['title'];
        var trackArtist =  data['artist']['name'];
        var duration =data['duration'];
        var trackLink =  data['preview'];
        final Music music = Music(
          name: trackName,
          artist: trackArtist,
          duration: duration,
          link: trackLink,
        );
        musicList.add(music);
      }
    } else {
    }
  }

  playMusic() async {
    await audioPlayer.play(UrlSource(
        'https://developers.deezer.com/%22https://www.deezer.com/track/3135553/%22'));
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
    trackListFuture = getTrackList(widget.trackList);
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: const GlassPlayerCard(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const PreferredSize( preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.imageUrl,
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
                  Column(
                    children: [
                      Container(
                        height: 234,
                        width: 360,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: Color(0xffa4c7c6), fontSize: 25),
                        ),
                      ),
                      addVerticalSpacing(10),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          widget.artistName,
                          style: const TextStyle(
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
                  SizedBox(
                    height: height-510,
                    child: FutureBuilder(
                        future:trackListFuture,
                        initialData: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              backgroundColor: Colors.white,
                            )),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text(
                                  'Something went wrong',
                                  style: mediumWhiteTextStyle,
                                ));
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: textColor,
                              ),
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: musicList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return MusicCardWidget(
                                  name: musicList[index].name,
                                  artist: musicList[index].artist,
                                  duration: musicList[index].duration);
                            },
                          );
                        }),
                  )
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
