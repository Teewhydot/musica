import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musica/models/album_model.dart';
import 'package:musica/models/music_model.dart';

class ApiFunctions extends ChangeNotifier{
  List<Music> musicList = [];
  List<Album> albumList = [];
  List<Music> get musixList => musicList;
  List<Album> get albumListX => albumList;
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

  Future getPlayList() async {

    try {
      http.Response response1 = await http.get(Uri.parse('https://api.deezer.com/user/2529/playlists'));
      if (response1.statusCode == 200) {
        var res1 = await jsonDecode(response1.body);
        var res2 = res1['data'];
        for (var data in res2) {
          var playListName = data['title'];
          var creator = data['creator']['name'];
          var noOfFans = data['id'];
          var trackList = data['tracklist'];
          var coverImage = data['picture_big'];
          final Album album = Album(
              trackList: trackList,
              title: playListName,
              fans: noOfFans,
              artistName: creator,
              imageUrl: coverImage);
          albumList.add(album);
        }
      } else {}
    } catch(e){

    }

  }

}