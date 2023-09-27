import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';
import 'package:sns_clone/commons/models/post_model.dart';
import 'package:sns_clone/write/repos/write_repo.dart';

class WritePostNotifier extends AsyncNotifier<void> {
  late final WriteRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.watch(writeRepo);
  }

  Future<void> uploadPost(
      String description, int emojiIndex, BuildContext context) async {
    // final user = ref.read(authRepoProvider).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.savePost(
        PostModel(
            description: description,
            creatorUid: ref.read(authRepoProvider).user!.uid,
            creator: "anonymous",
            createdAt: DateTime.now().millisecondsSinceEpoch,
            emojiIndex: emojiIndex),
      );
      context.pushReplacement("/home");
    });
  }
}

final writePostProvider = AsyncNotifierProvider<WritePostNotifier, void>(
  () => WritePostNotifier(),
);
