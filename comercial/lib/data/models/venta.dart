class Venta {
  final int? id;
  final String nombreCliente;
  final String nombreProducto;
  final double precio;
  final int cantidad;
  final String formaPago;
  final String fechaVenta;
  final bool confirmado;

  Venta(
      {this.id,
      required this.nombreCliente,
      required this.nombreProducto,
      required this.precio,
      required this.cantidad,
      required this.formaPago,
      required this.fechaVenta,
      required this.confirmado});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_cliente': nombreCliente,
      'nombre_producto': nombreProducto,
      'precio': precio,
      'cantidad': cantidad,
      'forma_pago': formaPago,
      'fecha_venta': fechaVenta,
      'confirmado': confirmado ? 1 : 0,
    };
  }

  @override
  String toString() {
    return '{cliente: $nombreCliente, producto: $nombreProducto, precio: $precio,cantidad:$cantidad,forma_pago:$formaPago,fecha_venta:$fechaVenta }';
  } 

}//Fin clase Venta