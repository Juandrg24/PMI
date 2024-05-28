import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'comercial.db'),
      version: 2,
      onCreate: (db, version) {
        db.execute(
            'create table ventas(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre_cliente TEXT, nombre_producto TEXT, precio REAL, cantidad INTEGER, forma_pago TEXT, fecha_venta TEXT, confirmado INTEGER)');
        print('Tabla Ventas Creada');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Agregar la tabla clientes cuando se actualiza desde una versión anterior a la 2
          await db.execute(
              'create table clientes(id INTEGER PRIMARY KEY AUTOINCREMENT, tipo_identificacion TEXT, identificacion INTEGER, nombre_completo TEXT, correo_electronico TEXT, fecha_ingreso TEXT, capacidad_credito INTEGER, activo INTEGER, imagen TEXT)');
        }
      },
    );
  }
}
