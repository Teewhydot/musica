import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/measure.dart';
import 'package:musica/models/new_releases_model.dart';
import 'package:musica/models/top_class_widget_model.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/glass_player_card.dart';
import 'package:musica/reusables/widgets/glassmorphism.dart';
import 'package:musica/reusables/widgets/top_class_widget.dart';
import 'package:musica/reusables/widgets/new_releases_widget.dart';
import 'package:musica/screens/drawer/drawer_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getAlbum()async{
    http.Response response  = await http.get(Uri.parse('https://api.deezer.com/album/302127'));
    if(response.statusCode == 200){
      var res = await jsonDecode(response.body);
      var title = res['title'];
      var fans = res['fans'];
      var artistName = res['artist']['name'];
      var coverImage = res['cover'];
      print('{$title  $fans  $artistName  $coverImage  }');
    } else {
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const NavigationDrawer(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: const GlassPlayerCard(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: textColor,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Image.asset(
          Assets.iconsMusicicon,
          height: 25,
          width: 25,
        ),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewReleasesModel> newReleasesModelList = [
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
      NewReleasesModel(Assets.imagesRectangle1),
    ];
    List<TopClassWidgetModel> topClassWidgetList = [
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
      TopClassWidgetModel(
          title: 'Golden age of 80\'s',
          artistName: 'Sean Swadder',
          image: Assets.imagesPlaylistImage,
          time: '1:24:98'),
    ];
    return ListView(
      children: [
        addVerticalSpacing(20),
        Padding(
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
                    style: smallWhiteTextStyle,
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
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        addVerticalSpacing(20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Top Charts',
            style: boldWhiteTextStyle.copyWith(fontSize: 24),
          ),
        ),
        addVerticalSpacing(20),
        SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topClassWidgetList.length,
              itemBuilder: (context, index) {
                return TopClassWidget(
                  image: topClassWidgetList[index].image,
                  title: topClassWidgetList[index].time,
                  artistName: topClassWidgetList[index].artistName,
                  time: topClassWidgetList[index].time,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'New Releases',
            style: boldWhiteTextStyle.copyWith(fontSize: 24),
          ),
        ),
        SizedBox(
          height: 153,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newReleasesModelList.length,
              itemBuilder: (context, index) {
                return NewReleasesWidget(
                  image: newReleasesModelList[index].image,
                );
              }),
        ),
        addVerticalSpacing(100),
      ],
    );
  }
}
