class Cliente {
  final int? id;
  final String tipoIdentificacion;
  final int identificacion;
  final String nombreCompleto;
  final String correoElectronico;
  final String fechaIngreso;
  final int capacidadCredito;
  final bool activo;
  final String imagen;

  Cliente(
      {this.id,
      required this.tipoIdentificacion,
      required this.identificacion,
      required this.nombreCompleto,
      required this.correoElectronico,
      required this.fechaIngreso,
      required this.capacidadCredito,
      required this.activo,
      required this.imagen});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo_identificacion': tipoIdentificacion,
      'identificacion': identificacion,
      'nombre_completo': nombreCompleto,
      'correo_electronico': correoElectronico,
      'fecha_ingreso': fechaIngreso,
      'capacidad_credito': capacidadCredito,
      'activo': activo ? 1 : 0,
      'imagen': imagen,
    };
  }

  @override
  String toString() {
    return '{tipo_identificacion: $tipoIdentificacion, identificacion: $identificacion, nombre_completo: $nombreCompleto,correo_electronico:$correoElectronico,fecha_ingreso:$fechaIngreso,capacidad_credito:$capacidadCredito, activo:$activo}';
  }
}//fin clase cliente
