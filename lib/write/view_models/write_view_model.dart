import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';
import 'package:sns_clone/write/models/write_model.dart';
import 'package:sns_clone/write/repos/write_repo.dart';

class WritePostNotifier extends AsyncNotifier<void> {
  late final WriteRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.watch(writeRepo);
  }

  Future<void> uploadPost(String description, int emojiIndex) async {
    // final user = ref.read(authRepoProvider).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.savePost(
        WriteModel(
            description: description,
            creatorUid: ref.read(authRepoProvider).user!.uid,
            creator: "anonymous",
            createdAt: DateTime.now().millisecondsSinceEpoch,
            emojiIndex: emojiIndex),
      );
    });
  }
}

final writePostProvider = AsyncNotifierProvider<WritePostNotifier, void>(
  () => WritePostNotifier(),
);
