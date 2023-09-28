import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/post/view_models/post_view_model.dart';
import 'package:sns_clone/post/widgets/post_widget.dart';

class PostTimeLineScreen extends ConsumerStatefulWidget {
  const PostTimeLineScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostTimeLineScreenState();
}

class _PostTimeLineScreenState extends ConsumerState<PostTimeLineScreen> {
  @override
  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(postProvider).when(
          data: (data) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => PostWidget(
                description: data[index].description,
                createdAt: data[index].createdAt,
                emojiIndex: data[index].emojiIndex,
                documentReference: data[index].documentReference,
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text("Could not load post: $error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
