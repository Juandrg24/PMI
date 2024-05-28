import 'package:comercial/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';

List tpIdentificaciones = [
  'Cédula',
  'Cédula Extranjeria',
  'NIT',
  'Pasaporte',
];

class FormClienteScreen extends StatelessWidget {
  const FormClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: ClienteScreen(),
    );
  }
}

class ClienteScreen extends StatefulWidget {
  const ClienteScreen({super.key});

  @override
  State<ClienteScreen> createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool activo = false;
  TextEditingController fechaIngresoController = TextEditingController();
  String tpIdentificacion = tpIdentificaciones.first;
  TextEditingController identificacionController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController capacidadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'Nuevo Cliente',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: formCliente(),
          ),
          const SizedBox(
            height: 5,
          ),
          buttonGuardar(),
        ],
      ),
    );
  }

  Widget formCliente() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          dropdownTpIdentificacion(),
          const SizedBox(
            height: 10,
          ),
          textFormIdentificacion(),
          const SizedBox(
            height: 10,
          ),
          textFormNombreCompleto(),
          const SizedBox(
            height: 10,
          ),
          textFormCorreoElectronico(),
          const SizedBox(
            height: 10,
          ),
          textFormFechaIngreso(),
          const SizedBox(
            height: 10,
          ),
          textFormCapacidadCredito(),
          const SizedBox(
            height: 10,
          ),
          switchActivo(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget dropdownTpIdentificacion() {
    return DropdownButtonFormField(
      value: tpIdentificacion,
      items: tpIdentificaciones.map((tpIdentidad) {
        return DropdownMenuItem(value: tpIdentidad, child: Text(tpIdentidad));
      }).toList(),
      onChanged: (value) {
        tpIdentificacion = value as String;
        print(tpIdentificacion);
      },
      validator: (value) {
        return (value == null)
            ? 'Debe seleccionar un Tipo de Identificación'
            : null;
      },
      decoration: const InputDecoration(
          labelText: 'Tipo de Identificación', border: OutlineInputBorder()),
    );
  }

  Widget textFormIdentificacion() {
    return TextFormField(
      controller: identificacionController,
      decoration: const InputDecoration(
        labelText: 'Identificación',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty) ? 'Debe agregar una identificación' : null;
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget textFormNombreCompleto() {
    return TextFormField(
      controller: nombreController,
      decoration: const InputDecoration(
        labelText: 'Nombre Completo',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty) ? 'Debe agregar un nombre' : null;
      },
    );
  }

  Widget textFormCorreoElectronico() {
    return TextFormField(
      controller: correoController,
      decoration: const InputDecoration(
        labelText: 'Correo Electronico',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty) ? 'Debe agregar un correo electronico' : null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget textFormFechaIngreso() {
    return TextFormField(
      controller: fechaIngresoController,
      decoration: const InputDecoration(
        labelText: 'Fecha de Ingreso',
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? fechaPicker = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025),
            initialDate: DateTime.now());
        if (fechaPicker != null) {
          String fecha = DateFormat('yyyy-MM-dd').format(fechaPicker);
          fechaIngresoController.text = fecha;
          setState(() {});
        } else {
          print('No se ha seleccionado ninguna fecha');
        }
      },
    );
  }

  Widget textFormCapacidadCredito() {
    return TextFormField(
      controller: capacidadController,
      decoration: const InputDecoration(
        labelText: 'Capacidad de Credito',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty)
            ? 'Debe agregar una capacidad de credito'
            : null;
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget switchActivo() {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: "Estado del CLiente",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: SwitchListTile(
        title: const Text("Activo ?"),
        value: activo,
        onChanged: (value) {
          activo = value;
          setState(() {});
        },
      ),
    );
  }

  Widget buttonGuardar() {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: ElevatedButton(
        onPressed: () {
          if (!formKey.currentState!.validate()) {
            return;
          } else {
            ClienteService.insert(cliente());
            print(cliente().toString());
          }
        },
        child: const Text(
          "Guardar",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Cliente cliente() {
    return Cliente(
      tipoIdentificacion: tpIdentificacion,
      identificacion: int.parse(identificacionController.text),
      nombreCompleto: nombreController.text,
      correoElectronico: correoController.text,
      fechaIngreso: fechaIngresoController.text,
      capacidadCredito: int.parse(capacidadController.text),
      activo: activo,
      imagen: "imagen",
    );
  }
}
