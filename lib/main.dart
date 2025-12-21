import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:project_moneyTracker_kel2/common/color_extension.dart';
import 'package:project_moneyTracker_kel2/view/main_tab/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'project_moneyTracker_kel2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
          background: TColor.gray80,
          surface: TColor.gray80,
          primary: TColor.primary,
          secondary: TColor.secondary,
          primaryContainer: TColor.gray60,
        ),
        useMaterial3: false,
      ),

            localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', 'ID'),         Locale('en', 'US'),       ],
      
      home: const MainTabView(),
    );
  }
}
