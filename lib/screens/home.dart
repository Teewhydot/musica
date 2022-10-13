import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/models/new_releases_model.dart';
import 'package:musica/models/top_class_widget_model.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/custom_app_bar.dart';
import 'package:musica/reusables/widgets/glass_player_card.dart';
import 'package:musica/reusables/widgets/large_home_card.dart';
import 'package:musica/reusables/widgets/top_class_widget.dart';
import 'package:musica/reusables/widgets/new_releases_widget.dart';
import 'package:musica/screens/drawer/drawer_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      drawer: NavigationDrawer(),
      backgroundColor: backgroundColor,
      // bottomNavigationBar: GlassPlayerCard(),
      appBar: PreferredSize( preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: HomeBody(),
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
        const LargeHomeCardWidget(),
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
        ReleasesWidget(newReleasesModelList: newReleasesModelList),
        addVerticalSpacing(100),
      ],
    );
  }
}
