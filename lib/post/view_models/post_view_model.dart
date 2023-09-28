import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/post/models/post_model.dart';
import 'package:sns_clone/write/repos/write_repo.dart';

class PostViewModel extends AsyncNotifier<List<PostModel>> {
  late final WriteRepository _repository;
  List<PostModel> _list = [];

  @override
  FutureOr<List<PostModel>> build() async {
    _repository = ref.read(writeRepo);
    final result = await _repository.fetchPosts();
    final newList = result.docs.map(
      (doc) => PostModel.fromJson(
        doc.data(),
        doc.reference,
      ),
    );
    _list = newList.toList();
    return _list;
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
