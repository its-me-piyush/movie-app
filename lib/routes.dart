import 'package:flutter/widgets.dart';

import 'screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (ctx) => const HomeScreen(),
};
