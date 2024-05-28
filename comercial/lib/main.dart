import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventas',
      initialRoute: AppRoutes.intialRoute,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}



// En base a la clase Cliente
//CRUD completo(Insertar, Eliminar, Modificar,Listar,Consultar)
