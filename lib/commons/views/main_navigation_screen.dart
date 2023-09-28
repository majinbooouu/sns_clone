import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/post/views/post_time_line_screen.dart';
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
    // context.go("/${_tabs[index]}");
    setState(() {});
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context.push("/setting");
                  },
                  icon: const FaIcon(FontAwesomeIcons.gear),
                ),
              ],
              title: const Text("🔥MOOD🔥"),
              elevation: 0,
              // backgroundColor: Theme.of(context).colorScheme.onPrimary,
            )
          : null,
      body: Stack(
        children: [
          Offstage(
              offstage: _selectedIndex != 0, child: const PostTimeLineScreen()),
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
