// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/pages/screens/drawer/drawer_all_screens/my_collection/collection_details_page.dart';
import 'package:musica/musica/presentation/widgets/reusables/constants.dart';
import 'package:musica/musica/presentation/widgets/reusables/widgets/custom_app_bar.dart';
import 'package:musica/musica/presentation/widgets/reusables/widgets/my_collections_widget.dart';
import 'package:page_transition/page_transition.dart';

class MyCollections extends StatefulWidget {
  const MyCollections({Key? key}) : super(key: key);

  @override
  State<MyCollections> createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections> {
  late Future albumFuture;
  MusicPlayerProvider musicPlayerProvider = MusicPlayerProvider();

  @override
  void initState() {
    super.initState();
    albumFuture = musicPlayerProvider.getPlayList();
  }

  List<bool> isActive = [true, false];
  @override
  Widget build(BuildContext context) {
    const Color activeColor = buttonPlayColor;
    final Color inactiveColor = textColor;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
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
                        child: Column(
                          children: [
                            addVerticalSpacing(200),
                            CircularProgressIndicator(
                              color: textColor,
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: musicPlayerProvider.albumListX.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: MyCollectionsCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: CollectionDetailsPage(
                                        title: musicPlayerProvider
                                            .albumListX[index].title,
                                        artistName: musicPlayerProvider
                                            .albumListX[index].artistName,
                                        fans: musicPlayerProvider
                                            .albumListX[index].fans,
                                        imageUrl: musicPlayerProvider
                                            .albumListX[index].imageUrl,
                                        trackList: musicPlayerProvider
                                            .albumListX[index].trackList,
                                      ),
                                      type: PageTransitionType.rightToLeft));
                            },
                            imageUrl:
                                musicPlayerProvider.albumListX[index].imageUrl,
                            title: musicPlayerProvider.albumListX[index].title,
                            artistName: musicPlayerProvider
                                .albumListX[index].artistName,
                            fans: musicPlayerProvider.albumListX[index].fans,
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
