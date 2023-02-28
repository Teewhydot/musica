import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musica/musica/domain/entities/album_model.dart';
import 'package:musica/musica/domain/entities/music_model.dart';

class MusicPlayerProvider extends ChangeNotifier {
  bool isPlaying = false;
  Duration position = const Duration(seconds: 0);
  Duration duration = const Duration(seconds: 0);
  List<Music> musicList = [];
  List<Album> albumList = [];
  List<Music> get musixList => musicList;
  List<Album> get albumListX => albumList;

  fromjson(dynamic jsonResponse) {
    final data = jsonResponse['data'];

    for (final albumData in data) {
      final album = Album.fromJson(albumData);
      albumList.add(album);
    }
    notifyListeners();
  }

  Future getTrackList(String apiLink) async {
    try {
      http.Response trackListResponse = await http.get(Uri.parse(apiLink));
      if (trackListResponse.statusCode == 200) {
        var res1 = await jsonDecode(trackListResponse.body);
        var res2 = res1['data'];
        for (var data in res2) {
          var trackName = data['title'];
          var trackArtist = data['artist']['name'];
          var duration = data['duration'];
          var trackLink = data['preview'];
          var noOfTracks = res1['total'];
          final Music music = Music(
            name: trackName,
            artist: trackArtist,
            duration: duration,
            link: trackLink,
            isPlaying: false,
            noOfTracks: noOfTracks,
          );
          musicList.add(music);
        }
      } else {}
    } catch (e) {
      throw Exception();
    }
  }

  Future getPlayList() async {
    try {
      http.Response playListResponse = await http
          .get(Uri.parse('https://api.deezer.com/user/2529/playlists'));
      if (playListResponse.statusCode == 200) {
        var response = await jsonDecode(playListResponse.body);
        fromjson(response);
      } else {}
    } catch (e) {
      throw Exception();
    }
  }

  bool get isPlayingMusic => isPlaying;
}
