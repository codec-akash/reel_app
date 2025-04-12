import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_video/model/post.dart';
import 'package:image_video/widgets/custom_action_button.dart';
import 'package:image_video/widgets/icon_text_button.dart';
import 'package:image_video/widgets/post_card.dart';

class ReelView extends StatefulWidget {
  final List<Post> posts;

  const ReelView({
    super.key,
    required this.posts,
  });

  @override
  State<ReelView> createState() => _ReelViewState();
}

class _ReelViewState extends State<ReelView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemCount: widget.posts.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return PostCard(
              post: widget.posts[index],
              isVisible: _currentPage == index,
            );
          },
        ),
        SafeArea(
          child: Positioned.fill(
              child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const Spacer(),
                  CustomActionButton(
                    icon: Icons.volume_off,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15),
                  CustomActionButton(
                    icon: Icons.tune_outlined,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                widget.posts[_currentPage].title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                widget.posts[_currentPage].description ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: GoogleFonts.bodoniModa().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconTextButton(
                    text: "Like",
                    icon: Icons.favorite_border,
                  ),
                  IconTextButton(
                    text: "Share",
                    icon: Icons.share,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          )),
        ),
      ],
    );
  }
}
