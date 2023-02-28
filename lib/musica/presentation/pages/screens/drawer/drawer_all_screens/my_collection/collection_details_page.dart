import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/animated_like_button.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/custom_app_bar.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/glass_player_card.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/music_card_widget.dart';

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
  late final AudioPlayer audioPlayer;
  MusicPlayerProvider musicProvider = MusicPlayerProvider();
  late Future trackListFuture;
  String currentPlayingMusicTitle = '';
  String currentPlayingMusicArtist = '';
  String currentTrackLink = '';

  @override
  void initState() {
    super.initState();
    trackListFuture = musicProvider.getTrackList(widget.trackList);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: SingleChildScrollView(
        child: Stack(clipBehavior: Clip.none, children: <Widget>[
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            color: Color(0xffa4c7c6), fontSize: 25),
                      ),
                    ),
                    addVerticalSpacing(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
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
                          const Expanded(
                              child: AnimatedLikeButton(
                                  text: "Like",
                                  animationPath: Assets.lottieAnimationsLike)),
                        ],
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                    future: trackListFuture,
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
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: musicProvider.musicList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return MusicCardWidget(
                            name: musicProvider.musicList[index].name,
                            artist: musicProvider.musicList[index].artist,
                            duration: musicProvider.musicList[index].duration,
                            trackLink: musicProvider.musicList[index].link,
                            onTapped: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return GlassPlayerCard(
                                    currentPlayingMusicTitle:
                                        musicProvider.musicList[index].name,
                                    musicArtist:
                                        musicProvider.musicList[index].artist,
                                    imageLink: widget.imageUrl,
                                    currentTrackLink:
                                        musicProvider.musicList[index].link);
                              }));
                            },
                          );
                        },
                      );
                    })
              ],
            ),
          ),
          addVerticalSpacing(200)
        ]),
      ),
    );
  }
}
