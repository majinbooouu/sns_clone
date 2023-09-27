import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';
import 'package:sns_clone/write/views/write_screen.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  static const routeName = "home";
  static const routeURL = "/";
  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "write",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {});
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              // actions: [
              //   IconButton(
              //     onPressed: () => ref
              //         .read(darkmodeConfigProvider.notifier)
              //         .setDarked(!ref.watch(darkmodeConfigProvider).dark),
              //     icon: ref.watch(darkmodeConfigProvider).dark
              //         ? const FaIcon(FontAwesomeIcons.moon)
              //         : const FaIcon(FontAwesomeIcons.sun),
              //   ),
              // ],
              title: const Text("🔥MOOD🔥"),
              elevation: 0,
              // backgroundColor: Theme.of(context).colorScheme.onPrimary,
            )
          : null,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    const Text("Home"),
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
                      child: const Text("Log out"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const WriteScreen(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => _onTap(value),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Theme.of(context).colorScheme.surface,
              ),
              selectedIcon: FaIcon(
                FontAwesomeIcons.house,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: 'home'),
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.penToSquare,
                color: Theme.of(context).colorScheme.surface,
              ),
              selectedIcon: FaIcon(
                FontAwesomeIcons.penToSquare,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: 'add'),
        ],
      ),
    );
  }
}
