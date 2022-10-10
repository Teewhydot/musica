import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/models/music_model.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/music_card_widget.dart';
import 'package:musica/reusables/widgets/my_collections_widget.dart';

class CollectionDetailsPage extends StatelessWidget {
  const CollectionDetailsPage({Key? key}) : super(key: key);

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
    final totalHeight = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      Center(child: MyCollectionsCard(onTap: () {})),
                      Row(
                        children: [
                          addHorizontalSpacing(30),
                          const Text(
                            'Tomorrows Tune\'s',
                            style: TextStyle(
                                color: Color(0xffa4c7c6), fontSize: 25),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          addHorizontalSpacing(30),
                          const Text(
                            'Lorem ipsum dolor sit amet\nConsecrate disciplining elite ut aliquam,\nPurus sit amet luctus venenatis',
                            style: TextStyle(
                                color: Color(0xffa4c7c6), fontSize: 15),
                          ),
                        ],
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
                    height: 300,
                    child: ListView.builder(
                      physics: ScrollPhysics(
                      ),
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
