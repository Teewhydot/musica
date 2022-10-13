// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/models/album_model.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/my_collections_widget.dart';
import 'package:musica/screens/drawer/drawer_all_screens/my_collection/collection_details_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class MyCollections extends StatefulWidget {
  const MyCollections({Key? key}) : super(key: key);

  @override
  State<MyCollections> createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections> {
  List<Album> albumList = [];
  late Future albumFuture;

  Future getAlbum() async {
    http.Response response1 =
        await http.get(Uri.parse('https://api.deezer.com/album/302127'));
    http.Response response2 =
        await http.get(Uri.parse('https://api.deezer.com/album/446746'));
    http.Response response3 =
        await http.get(Uri.parse('https://api.deezer.com/album/446744'));
    http.Response response4 =
        await http.get(Uri.parse('https://api.deezer.com/album/345676'));
    if (response1.statusCode == 200 &&
        response2.statusCode == 200 &&
        response3.statusCode == 200 &&
        response4.statusCode == 200) {
      var res1 = await jsonDecode(response1.body);
      var res2 = await jsonDecode(response2.body);
      var res3 = await jsonDecode(response3.body);
      var res4 = await jsonDecode(response4.body);
      var title1 = res1['title'];
      var fans1 = res1['fans'];
      var artistName1 = res1['artist']['name'];
      var coverImage1 = res1['cover'];
      var trackList1 = res1['tracklist'];

      final Album album1 = Album(
        trackList: trackList1,
          title: title1,
          fans: fans1,
          artistName: artistName1,
          imageUrl: coverImage1);
      var title2 = res2['title'];
      var fans2 = res2['fans'];
      var artistName2 = res2['artist']['name'];
      var coverImage2 = res2['cover'];
      var trackList2 = res2['tracklist'];
      print(trackList1);
      print(trackList2);
      final Album album2 = Album(
        trackList: trackList2,
          title: title2,
          fans: fans2,
          artistName: artistName2,
          imageUrl: coverImage2);
      var title3 = res3['title'];
      var fans3 = res3['fans'];
      var artistName3 = res3['artist']['name'];
      var coverImage3 = res3['cover'];
      var trackList3 = res3['tracklist'];
      final Album album3 = Album(
        trackList: trackList3,
          title: title3,
          fans: fans3,
          artistName: artistName3,
          imageUrl: coverImage3);
      var title4 = res4['title'];
      var fans4 = res4['fans'];
      var artistName4 = res4['artist']['name'];
      var coverImage4 = res4['cover'];
      var trackList4 = res4['tracklist'];
      final Album album4 = Album(
        trackList: trackList4,
          title: title4,
          fans: fans4,
          artistName: artistName4,
          imageUrl: coverImage4);
      albumList.add(album1);
      albumList.add(album2);
      albumList.add(album3);
      albumList.add(album4);
    } else {}
  }

  @override
  void initState() {
    super.initState();
    albumFuture = getAlbum();
  }

  bool isCActive = false;
  bool isLActive = false;
  List<bool> isActive = [true, false];
  @override
  Widget build(BuildContext context) {
    const Color activeColor = buttonPlayColor;
    final Color inactiveColor = textColor;
    return Scaffold(
      backgroundColor: backgroundColor,
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
        backgroundColor: backgroundColor,
        title: Image.asset(
          Assets.iconsMusicicon,
          height: 25,
          width: 25,
        ),
      ),
      body: ListView(
        children: [
          addVerticalSpacing(20),
          Center(
            child: ToggleButtons(
              fillColor: Colors.transparent,
              onPressed: (int newIndex) {
                setState(() {
                  for (int index = 0; index < isActive.length; index++) {
                    if (index == newIndex) {
                      isActive[index] = true;
                    } else {
                      isActive[index] = false;
                    }
                  }
                });
              },
              isSelected: isActive,
              children: [
                RowOption(
                  text: const Text(
                    'My collections',
                    style: mediumWhiteTextStyle,
                  ),
                  color: isActive[0] == true ? activeColor : inactiveColor,
                ),
                RowOption(
                  text: const Text(
                    'Likes',
                    style: mediumWhiteTextStyle,
                  ),
                  color: isActive[1] == true ? activeColor : inactiveColor,
                ),
              ],
            ),
          ),
          isActive[0] == true
              ? FutureBuilder(
                  future: albumFuture,
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
                      itemCount: albumList.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: MyCollectionsCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: CollectionDetailsPage(
                                      title: albumList[index].title,
                                      artistName: albumList[index].artistName,
                                      fans: albumList[index].fans,
                                      imageUrl: albumList[index].imageUrl,
                                      trackList: albumList[index].trackList,
                                      ),
                                      type: PageTransitionType.rightToLeft));
                            },
                            imageUrl: albumList[index].imageUrl,
                            title: albumList[index].title,
                            artistName: albumList[index].artistName,
                            fans: albumList[index].fans,
                          ),
                        );
                      },
                    );
                  })
              : Container(),
        ],
      ),
    );
  }
}

class RowOption extends StatelessWidget {
  final Widget text;
  final color;

  const RowOption({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: textColor),
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: text),
    );
  }
}
