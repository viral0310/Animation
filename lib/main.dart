import 'package:ch_10_animation/screens/explicit/built%20in.dart';
import 'package:ch_10_animation/screens/explicit/custom.dart';
import 'package:ch_10_animation/screens/explicit/explicitStaggered.dart';
import 'package:ch_10_animation/screens/explicit/home%20explcit.dart';
import 'package:ch_10_animation/screens/explicit/play%20pause.dart';
import 'package:ch_10_animation/screens/hero_pages/hero%20page%201.dart';
import 'package:ch_10_animation/screens/hero_pages/heropage2.dart';
import 'package:ch_10_animation/screens/home%20page.dart';
import 'package:ch_10_animation/screens/implicit/CustomImplicitPage.dart';
import 'package:ch_10_animation/screens/implicit/buit%20in%20implicit.dart';
import 'package:ch_10_animation/screens/implicit/implicit%20page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.teal)),
      routes: {
        '/': (context) => const HomePage(),
        '/hero_page_1': (context) => const HeroPage1(),
        '/hero_page_2': (context) => const HeroPage2(),
        '/implicit': (context) => const ImplisitPage(),
        '/builtin': (context) => const BuitInExlicit(),
        '/custom': (context) => const CustomImplicitPage(),
        '/explicit': (context) => const ExplicitPage(),
        '/explicitBuiltIn': (context) => const ExplicitBuitInPage(),
        '/explicitCustom': (context) => const ExplicitCustomPage(),
        '/explicitStaggered': (context) => const ExplicitStaggeredPage(),
        '/explicit_play_pause': (context) => const PlayPause(),
      },
      initialRoute: '/',
    ),
  );
}
