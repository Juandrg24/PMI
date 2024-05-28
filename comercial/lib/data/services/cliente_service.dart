import 'package:comercial/data/models/models.dart';
import 'package:comercial/data/services/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ClienteService {
  // static Future<Database> openDB() async {
  //   return openDatabase(
  //     join(await getDatabasesPath(), 'comercial.db'),
  //     version: 2,
  //     onCreate: (db, version) {
  //       db.execute(
  //           'create table clientes(id INTEGER PRIMARY KEY AUTOINCREMENT,tipo_identificacion TEXT, identificacion INTEGER, nombre_completo TEXT, correo_electronico TEXT, fecha_ingreso TEXT, capacidad_credito INTEGER, activo INTEGER,imagen TEXT)');
  //       print("Tabla Clientes creada");
  //       db.execute(
  //           'create table ventas(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre_cliente TEXT, nombre_producto TEXT, precio REAL, cantidad INTEGER, forma_pago TEXT, fecha_venta TEXT, confirmado INTEGER)');
  //       print('Tabla Ventas Creada');
  //     },
  //   );
  // }

  static Future<void> insert(Cliente cliente) async {
    DatabaseService dbService = DatabaseService();

    Database db = await dbService.openDB();
    await db.insert('clientes', cliente.toMap());
  }
}//Fin Clase CLienteService


