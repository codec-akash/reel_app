import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_video/model/post.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:image_video/widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Post> posts;

  @override
  void initState() {
    posts = [];
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadPosts();
    });
  }

  Future<void> loadPosts() async {
    final String response =
        await rootBundle.rootBundle.loadString('lib/api_json.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      posts = data.map((json) => Post.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (index >= posts.length) {
            return const SizedBox.shrink();
          }
          if (posts[index].postUrl == null) {
            return const SizedBox.shrink();
          }
          return PostCard(post: posts[index]);
        },
      ),
    );
  }
}
