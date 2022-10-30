import '../../views/home_screen/page/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'app_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().colorPellet: (context) => const ColorPellets(),
};
