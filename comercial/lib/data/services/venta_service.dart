import 'package:comercial/data/services/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../models/models.dart';

class VentaService {
  // static Future<Database> openDB() async {
  //   return openDatabase(
  //     join(await getDatabasesPath(), 'comercial.db'),
  //     version: 1,
  //     onCreate: (db, version) {
  //       db.execute(
  //           'create table ventas(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre_cliente TEXT, nombre_producto TEXT, precio REAL, cantidad INTEGER, forma_pago TEXT, fecha_venta TEXT, confirmado INTEGER)');
  //       print('Tabla Ventas Creada');
  //       db.execute(
  //           'create table clientes(id INTEGER PRIMARY KEY AUTOINCREMENT,tipo_identificacion TEXT, identificacion INTEGER, nombre_completo TEXT, correo_electronico TEXT, fecha_ingreso TEXT, capacidad_credito INTEGER, activo INTEGER,imagen TEXT)');
  //       print("Tabla Clientes creada");
  //     },
  //   );
  // }

  static Future<void> insert(Venta venta) async {
    DatabaseService dbService = DatabaseService();
    Database db = await dbService.openDB();
    await db.insert('ventas', venta.toMap());
  }
}//Fin de la clase ventaservise
