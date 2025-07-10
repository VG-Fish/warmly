import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:warmly/state/main_navigation_state.dart';
import 'package:warmly/pages/home/home.dart';
import 'package:warmly/pages/chat/chat.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavigationState>(
      builder: (context, navigationState, _) {
        final pages = [HomePage(), ChatPage()];

        return Scaffold(
          body: IndexedStack(
            index: navigationState.selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationState.selectedIndex,
            onTap: (index) {
              navigationState.selectedIndex = index;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            ],
          ),
        );
      },
    );
  }
}
