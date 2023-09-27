import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';

class TestHomeScreen extends ConsumerWidget {
  const TestHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("data"),
            ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      // content: const Text("Plx dont go"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("No"),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            ref.read(authRepoProvider).signOut();
                            context.go("/signin");
                          },
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Log out"))
          ],
        ),
      ),
    );
  }
}
