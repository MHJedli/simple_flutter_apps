import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorsScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 147, 117, 217),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // Lock screent to portrait up direction
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
          colorScheme: kColorsScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kColorsScheme.onPrimaryContainer,
              foregroundColor: kColorsScheme.primaryContainer),
          cardTheme: CardTheme().copyWith(
            color: kColorsScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorsScheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorsScheme.onSecondaryContainer,
                  fontSize: 18,
                ),
              )),
      themeMode: ThemeMode.system,
      home: Expenses(),
    );
  }
}
