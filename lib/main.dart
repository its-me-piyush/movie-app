import 'package:flutter/material.dart';
import 'package:movie_app_mark_3/provider/top_row_provider.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import 'routes.dart';
import 'screens/home/home_screen.dart';
import 'provider/genres_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GenresProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TopRowProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'The Movie App',
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: routes,
        theme: theme(),
      ),
    );
  }
}
