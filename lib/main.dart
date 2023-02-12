import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'screen/bmi.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeStyle(),
      initialRoute: '/',
      routes: {
        '/': (context) => const BMI(),
      },
    );
  }
}
