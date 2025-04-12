import 'package:flutter/material.dart';
import 'package:image_video/model/post.dart';
import 'package:image_video/utils/asset_widget.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: AssetWidget(path: widget.post.postUrl ?? ''),
    );
  }
}
