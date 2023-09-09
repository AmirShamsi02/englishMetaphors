import 'package:english_medifors/auth.dart';
import 'package:english_medifors/leitner.dart';
import 'package:english_medifors/settings.dart';
import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  Locale locale = Locale('fa');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: themeMode == ThemeMode.light
            ? _MyappThemes.light().theme()
            : _MyappThemes.dark().theme(),
        locale: locale == Locale('fa')
            ? Locale('fa')
            : Locale('en'),
        title: 'Flutter Demo',
        home: MainScreen(
          toggleTheme: (bool theme) {
            setState(() {
              theme ? themeMode = ThemeMode.light : themeMode = ThemeMode.dark;
            });
          },
          toggleLanguage: (bool lan) {
            print(lan);
            setState(() {
              lan ? locale = Locale('fa') : locale = Locale('en');
              print(locale);
            });
          },
        ));
  }
}

class _MyappThemes {
  static const defaultFontFamily = 'Montserrat';
  final Color primaryTextColor;
  final Color seondryTextColor;
  final Color primaryColor;
  final Color surface;
  final Color onPrimary;
  final Color background;
  final Color appbarColor;

  _MyappThemes.dark()
      : primaryTextColor = const Color(0xffeeeeee),
        seondryTextColor = Colors.white70,
        surface = const Color.fromARGB(255, 97, 97, 101),
        background = const Color.fromARGB(255, 56, 56, 56),
        primaryColor = const Color(0xff5a4e8d),
        onPrimary = const Color(0xffb39bd8),
        appbarColor = Colors.black;

  _MyappThemes.light()
      : primaryTextColor = const Color(0xff000033),
        seondryTextColor = const Color(0xff888888),
        surface = const Color(0xffe8ddf8),
        background = const Color(0xfff5f5f5),
        primaryColor = const Color(0xffb39bd8),
        onPrimary = const Color(0xff382c52),
        appbarColor = Colors.white;

  ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(backgroundColor: surface, elevation: 0),
      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a blue toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.
      textTheme: TextTheme(
        displayMedium: TextStyle(
          fontFamily: defaultFontFamily,
          color: primaryTextColor,
        ),
        displaySmall: TextStyle(
          fontFamily: defaultFontFamily,
          color: primaryTextColor,
        ),
        titleLarge: TextStyle(
            fontFamily: defaultFontFamily,
            color: primaryTextColor,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontFamily: defaultFontFamily,
            color: primaryTextColor,
            fontSize: 20),
        labelLarge: TextStyle(
            fontFamily: defaultFontFamily,
            color: seondryTextColor,
            fontSize: 18),
        labelMedium: TextStyle(
          fontFamily: defaultFontFamily,
          color: seondryTextColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: defaultFontFamily,
          color: primaryTextColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: defaultFontFamily,
          color: primaryTextColor,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        onPrimary: onPrimary,
        onSurface: primaryTextColor,
        onBackground: primaryTextColor,
        background: background,
        surface: surface,
        secondary: seondryTextColor,
      ),
      useMaterial3: true,
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(bool) toggleTheme;
  final Function(bool) toggleLanguage;

  const MainScreen(
      {super.key, required this.toggleTheme, required this.toggleLanguage});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomnavigationBar(
        select: (int index) {
          setState(() {
            selectedScreen = index;
          });
        },
      ),
      body: IndexedStack(
        index: selectedScreen,
        children: [
          const HomePage(),
          const Leitner(),
          const AuthScreen(),
          Settings(
            toggleTheme: (bool theme) {
              widget.toggleTheme(theme);
            },
            toggleLanguage: (bool lan) {
              widget.toggleLanguage(lan);
            },
          ),
        ],
      ),
    );
  }
}
