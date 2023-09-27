import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sns_clone/commons/views/main_navigation_screen.dart';
import 'package:sns_clone/write/view_models/write_view_model.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({
    super.key,
  });

  @override
  WriteScreenState createState() => WriteScreenState();
}

class WriteScreenState extends ConsumerState<WriteScreen> {
  bool _isTextFilled = false;

  final TextEditingController _textEditingController = TextEditingController();

  void _onCancelTap(BuildContext context) {
    Navigator.of(context).pop(
      MainNavigationScreen.routeName,
    );
  }

  // void _onClipTap(BuildContext context) {
  //   Navigator.of(context).pushNamed(
  //     VideoRecordingScreen.routeName,
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isTextFilled = _textEditingController.text.isNotEmpty;
    });
  }

  void onNextPressed() async {
    ref.read(writePostProvider.notifier).uploadPost(
          _textEditingController.text,
          context,
        );

    // Navigator.of(context).pop(
    //   MainNavigationScreen.routeName,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: "Start a thread...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: -20,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Anyone can play",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _isTextFilled ? onNextPressed : null,
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )),
                        child: const Text(
                          "Next",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
