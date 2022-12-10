import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:musica/models/album_model.dart';
import 'package:musica/models/music_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MusicPlayerProvider extends ChangeNotifier{
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration position = const Duration(seconds: 0);
  Duration duration = const Duration(seconds: 0);
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
          print(noOfTracks);
        }

      } else {}
    } catch(e){
      print(e);
    }

  }

  Future getPlayList() async {

    try {
      http.Response response1 = await http.get(Uri.parse('https://api.deezer.com/user/2529/playlists'));
      if (response1.statusCode == 200) {
        var response = await jsonDecode(response1.body);
        var listOfPlayLists = response['data'];
        for (var data in listOfPlayLists) {
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

  void playNextMusic(int index) async {
    if (index < musicList.length - 1) {
      index++;
      await audioPlayer.play(UrlSource(musicList[index].link));
    } else {
      await audioPlayer.play(UrlSource(musicList[0].link));
    }
  }

  bool get isPlayingMusic => isPlaying;
  void playMusic(String url)async{
    await audioPlayer.play(UrlSource(url));
    isPlaying = true;
    notifyListeners();
  }
  void pauseMusic()async{
    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void resumeMusic()async{
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }
}