import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_example/view/video_player_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Video Player",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var videoUrl=Uri.parse("https://player.vimeo.com/external/635683811.sd.mp4?s=6df90accca886c2bbc4151b6c904659dbed0b2da&profile_id=164&oauth2_token_id=57447761");

    return Scaffold(
      body: Center(
        child: VideoPlayerWidget(videoUrl: videoUrl),
      ),
    );
  }
}



