import 'package:flutter/material.dart';
import 'package:image_video/model/post.dart';
import 'package:video_player/video_player.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final bool isVisible;

  const PostCard({
    super.key,
    required this.post,
    required this.isVisible,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  VideoPlayerController? _controller;
  bool _isVideoPost = false;

  @override
  void initState() {
    super.initState();
    _initializePost();
  }

  @override
  void didUpdateWidget(PostCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      _handleVisibilityChange();
    }
  }

  void _initializePost() {
    if (widget.post.postUrl == null) return;

    _isVideoPost = widget.post.postUrl!.endsWith('.mp4');
    if (_isVideoPost) {
      _controller = VideoPlayerController.asset(widget.post.postUrl!)
        ..initialize().then((_) {
          setState(() {});
          if (widget.isVisible) {
            _controller!.play();
            _controller!.setLooping(true);
          }
        });
    }
  }

  void _handleVisibilityChange() {
    if (_controller == null) return;

    if (widget.isVisible) {
      _controller!.play();
      _controller!.setLooping(true);
    } else {
      _controller!.pause();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.post.postUrl == null) {
      return const SizedBox.shrink();
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: _buildMediaContent(),
    );
  }

  Widget _buildMediaContent() {
    if (_isVideoPost) {
      if (_controller == null || !_controller!.value.isInitialized) {
        return const Center(child: CircularProgressIndicator());
      }
      return Center(
        child: AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        ),
      );
    } else {
      return Image.asset(
        widget.post.postUrl!,
        fit: BoxFit.contain,
      );
    }
  }
}
