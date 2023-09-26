import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';

class SignInViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepoProvider);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repository.signIn(email, password),
    );
    if (state.hasError) {
      final snack = SnackBar(
        content: Text((state.error as FirebaseAuthException).message ??
            "Something wen't wrong."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } else {
      context.go("/home");
    }
  }
}

final loginProvider = AsyncNotifierProvider<SignInViewModel, void>(
  () => SignInViewModel(),
);
