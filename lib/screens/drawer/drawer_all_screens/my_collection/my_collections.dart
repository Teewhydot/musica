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
    http.Response response =
        await http.get(Uri.parse('https://api.deezer.com/album/302127'));
    if (response.statusCode == 200) {
      var res = await jsonDecode(response.body);
      var title = res['title'];
      var fans = res['fans'];
      var artistName = res['artist']['name'];
      var coverImage = res['cover'];
      final Album album = Album(
          title: title,
          fans: fans,
          artistName: artistName,
          imageUrl: coverImage);
      albumList.add(album);
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
                  initialData:const Center(child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.white,
                  )),
                  builder: (context, snapshot) {

                    if (snapshot.hasError) {
                      return const Center(child: Text('Something went wrong',style: mediumWhiteTextStyle,));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
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
                        return MyCollectionsCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const CollectionDetailsPage(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          imageUrl: albumList[index].imageUrl,
                          title: albumList[index].title,
                          artistName: albumList[index].artistName,
                          fans: albumList[index].fans,
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
