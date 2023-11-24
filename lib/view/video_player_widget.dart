
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});
  final Uri videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController=VideoPlayerController.networkUrl(widget.videoUrl);
    initializeVideoPlayerFuture=videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
      videoPlayerController.setLooping(true);

      setState(() {

      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    videoPlayerController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeVideoPlayerFuture,
        builder: (context, snapshot){
          if (snapshot.connectionState==ConnectionState.done){
            return AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            );

          } else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        }
    );
  }
}