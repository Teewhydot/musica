import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musica/models/music_model.dart';

class ApiFunctions {
  List<Music> musicList = [];

  Future getTrackList(String apiLink) async {
    try {
      http.Response response1 = await http.get(Uri.parse(apiLink));
      if (response1.statusCode == 200) {
        var res1 = await jsonDecode(response1.body);
        var res2 = res1['data'];
        for (var data in res2) {
          var trackName = data['title'];
          var trackArtist = data['artist']['name'];
          var duration = data['duration'];
          var trackLink = data['preview'];
          final Music music = Music(
            name: trackName,
            artist: trackArtist,
            duration: duration,
            link: trackLink,
          );
          musicList.add(music);
        }
      } else {}
    } catch(e){

    }

  }
}