import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/video_scoring/presentation/bloc/video_scoring_bloc.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoScoringPage extends StatefulWidget {
  const VideoScoringPage({super.key});

  @override
  _VideoScoringPageState createState() => _VideoScoringPageState();
}

class _VideoScoringPageState extends State<VideoScoringPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  final logger = Logger((_VideoScoringPageState).toString());

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));

    await _videoPlayerController.initialize();

    _createChewieController();

    setState(() {});

    // todo: poll position
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: false,
      overlay: Text("Scoreboard here")
    );
  }

  int currPlayIndex = 0;

  Future<File?> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null) return null;

    var path = result.files.single.path;

    if (path == null) return null;

    return File(path);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<VideoScoringBloc>()..add(const InitialEvent()),
        child: BlocBuilder<VideoScoringBloc, VideoScoringState>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: _chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                        ? Chewie(
                      controller: _chewieController!,
                    )
                        : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                  },
                  child: Text("Go back"),
                )
              ],
            );
          }
        ),
    );
  }
}

class VideoScoringRootPage extends StatelessWidget {
  const VideoScoringRootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VideoScoringBloc>()..add(const InitialEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scoring'),
        ),
        body: BlocBuilder<VideoScoringBloc, VideoScoringState>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  ElevatedButton(onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideoScoringPage())
                    );
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight]);
                  }, child: Text("Go to scoring"))
                ],
              );
            }
        ),
      ),
    );
  }
}