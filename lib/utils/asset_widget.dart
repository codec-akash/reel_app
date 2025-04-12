import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class AssetWidget extends StatelessWidget {
  final String path;

  const AssetWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('.mp4')) {
      return _buildVideoPlayer(path);
    } else if (path.endsWith('.svg')) {
      return SvgPicture.asset(path);
    } else if (path.endsWith('.png') ||
        path.endsWith('.jpg') ||
        path.endsWith('.jpeg')) {
      return Image.asset(path);
    } else {
      return Container(); // Return an empty container for unsupported formats
    }
  }

  Widget _buildVideoPlayer(String path) {
    VideoPlayerController controller = VideoPlayerController.asset(path);
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
