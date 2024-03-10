import 'package:flutter/material.dart';
import 'package:task3/constants/colors.dart';
import 'package:video_player/video_player.dart';
class VideoItem extends StatefulWidget {
  final String videoUrl;

  VideoItem({required this.videoUrl});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying=false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(children:[
          AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
            Center(child:IconButton(
              icon:Icon(
                _isPlaying?Icons.pause:Icons.play_arrow,
                color:kPrimaryColor,
              ),
              onPressed:(){
                setState(() {
                  if(_isPlaying){
                    _controller.pause();
                  }
                  else{
                    _controller.play();
                  }
                  _isPlaying=!_isPlaying;
                });
              },

            ),
            ),

          ]);

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideoGridView extends StatelessWidget {
  final List<String> videoUrls = [

    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',

    // Add more video URLs as needed
  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: videoUrls.length,
      itemBuilder: (context, index) {
        return VideoItem(videoUrl: videoUrls[index]);
      },
    );
  }
}