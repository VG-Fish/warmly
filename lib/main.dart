import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:warmly/pages/core/main_navigation.dart';
import 'package:warmly/state/main_navigation_state.dart';

void main() {
  runApp(const Warmly());
}

class Warmly extends StatelessWidget {
  const Warmly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MainNavigationState())],
      child: MaterialApp(
        title: 'Warmly',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
        home: MainNavigation(),
      ),
    );
  }
}
