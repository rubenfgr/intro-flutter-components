import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/home_page.dart';
import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/pages/animated_container_page.dart';
import 'package:flutter_componentes/src/pages/avatar_page.dart';
import 'package:flutter_componentes/src/pages/card_page.dart';
import 'package:flutter_componentes/src/pages/input_page.dart';
import 'package:flutter_componentes/src/pages/listview_page.dart';
import 'package:flutter_componentes/src/pages/slider_page.dart';
import 'package:flutter_componentes/src/pages/user_form_page.dart';
import 'package:flutter_componentes/src/pages/users_list_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomePage(),
        'avatar': (BuildContext context) => const AvatarPage(),
        'card': (context) => const CardPage(),
        'http': (context) => const HttpPage(),
        'user_form': (context) => UserFormPage(),
        'animated_container': (context) => const AnimatedContainerPage(),
        'inputs': (context) => const InputPage(),
        'slider': (context) => const SliderPage(),
        'listview': (context) => const ListViewPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const AlertPage());
      },
    );
  }
}
