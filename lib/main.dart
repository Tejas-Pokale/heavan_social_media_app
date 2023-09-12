import 'package:flutter/material.dart';
import 'package:video_player_app/screens/home.dart';
import 'package:video_player_app/screens/search.dart';
import 'package:video_player_app/screens/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme:
            const AppBarTheme().copyWith(backgroundColor: Colors.black),
      ),
      home: HomeScreen(),
    );
  }
}
