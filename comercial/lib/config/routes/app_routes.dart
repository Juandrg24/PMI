import 'package:flutter/material.dart';
import '../../view/screens/screens.dart';

class AppRoutes {
  static const intialRoute = 'formclientescreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    'formclientescreen': (context) => const FormClienteScreen(),
  };
}
