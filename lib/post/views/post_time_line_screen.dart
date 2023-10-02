import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/post/view_models/post_view_model.dart';
import 'package:sns_clone/post/widgets/post_widget.dart';

class PostTimeLineScreen extends ConsumerStatefulWidget {
  const PostTimeLineScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      PostTimeLineScreenState();
}

class PostTimeLineScreenState extends ConsumerState<PostTimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(postStreamProvider).when(
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

// final rebuildProvider = Provider<void Function()>(
//   (ref) => () {
//     // UI를 업데이트하고 상태를 갱신하는 작업 수행
//     ref.read(postProvider.notifier).build();
//     // postProvider를 읽어서 새로운 데이터를 가져오거나 업데이트할 수 있음
//     print("object");
//   },
// );
