import 'package:flutter/material.dart';

class ListVentaScreen extends StatefulWidget {
  const ListVentaScreen({super.key});

  @override
  State<ListVentaScreen> createState() => _ListVentaScreenState();
}

class _ListVentaScreenState extends State<ListVentaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Listado de ventas'),
      ),
      body: Container(),
    );
  }
}