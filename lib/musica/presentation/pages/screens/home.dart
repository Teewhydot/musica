import 'package:flutter/material.dart';
import 'package:musica/musica/domain/mock_files/mock_albums/new_releases_album.dart';
import 'package:musica/musica/domain/mock_files/mock_albums/top_charts_album.dart';
import 'package:musica/musica/presentation/pages/screens/drawer/drawer_screen.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/custom_app_bar.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/large_home_card.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/new_releases_widget.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/top_class_widget.dart';

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
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
    return ListView(
      children: [
        addVerticalSpacing(20),
        GestureDetector(onTap: () {}, child: const LargeHomeCardWidget()),
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
              itemCount: getTopChartsList().length,
              itemBuilder: (context, index) {
                return TopClassWidget(
                  image: getTopChartsList()[index].image,
                  title: getTopChartsList()[index].time,
                  artistName: getTopChartsList()[index].artistName,
                  time: getTopChartsList()[index].time,
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
        ReleasesWidget(newReleasesModelList: newReleasesList()),
        addVerticalSpacing(100),
      ],
    );
  }
}
