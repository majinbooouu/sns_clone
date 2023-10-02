import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';
import 'package:sns_clone/post/models/post_model.dart';

final postStreamProvider = StreamProvider<List<PostModel>>((ref) async* {
  ref.watch(authStateProvider);
  final isLoggedIn = ref.read(authRepoProvider).isLoggedIn;
  if (isLoggedIn) {
    // Firebase Firestore에서 글 목록을 가져와서 실시간으로 업데이트합니다.
    final firestore = FirebaseFirestore.instance;
    final query =
        firestore.collection('posts').orderBy('createdAt', descending: true);

    final Stream<QuerySnapshot> snapshots = query.snapshots();

    // 초기 데이터를 추가합니다.
    yield* snapshots.map((snapshot) {
      final List<PostModel> posts = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return PostModel.fromJson(data, doc.reference);
      }).toList();

      return posts;
    });
  }
});

// final postStreamProvider = StreamProvider<List<PostModel>>((ref) {
//   final auth = ref.read(authStateProvider);
//   final repo = ref.read(authRepoProvider);
//   final query = FirebaseFirestore.instance.collection('posts');

//   return auth.when(
//     data: (user) {
//       if (user != null) {
//         // Firebase 사용자가 로그인한 경우
//         return query.snapshots().map((snapshot) {
//           return snapshot.docs.map((doc) {
//             return PostModel.fromJson(
//               doc.data(),
//               doc.reference,
//             );
//           }).toList();
//         });
//       } else {
//         // Firebase 사용자가 로그아웃한 경우 빈 목록을 반환하거나 다른 로직을 사용할 수 있습니다.
//         return Stream.value([]);
//       }
//     },
//     loading: () {
//       // 인증 상태를 기다리는 동안 로딩 상태를 반환할 수 있습니다.
//       return Stream.value([]);
//     },
//     error: (error, stackTrace) {
//       // 에러가 발생한 경우 에러 상태를 반환할 수 있습니다.
//       return Stream.error(error);
//     },
//   );
// });
