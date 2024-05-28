import 'package:comercial/data/models/models.dart';
import 'package:comercial/data/services/venta_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List clientes = [
  'Clara Inés García',
  'Jorge Ignacio Bedoya',
  'María Luisa Cheverra'
];

class FormVentaScreen extends StatelessWidget {
  const FormVentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas'),
      ),
      body: FormVenta(),
    );
  }
}

class FormVenta extends StatefulWidget {
  const FormVenta({super.key});

  @override
  State<FormVenta> createState() => _FormVentaState();
}

class _FormVentaState extends State<FormVenta> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool confirmado = false;
  String formaPago = 'Contado';
  TextEditingController fechaController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  

  String cliente = clientes.first;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'Nueva venta',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: formVenta(),
          ),
          const SizedBox(
            height: 5,
          ),
          buttonGuardar(),
        ],
      ),
    );
  }

  Widget formVenta() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            dropdownCliente(),
            const SizedBox(
              height: 10,
            ),
            textFormProducto(),
            const SizedBox(
              height: 10,
            ),
            textFormPrecio(),
            const SizedBox(
              height: 10,
            ),
            textFormCantidad(),
            const SizedBox(
              height: 10,
            ),
            radioFormaPago(),
            const SizedBox(
              height: 10,
            ),
            textFormFecha(),
            const SizedBox(
              height: 10,
            ),
            switchConfirmado(),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Widget dropdownCliente() {
    return DropdownButtonFormField(
      value: cliente,
      items: clientes.map((cliente) {
        return DropdownMenuItem(value: cliente, child: Text(cliente));
      }).toList(),
      onChanged: (value) {
       cliente= value as String;
       print(cliente);
      },
      validator: (value) {
        return (value == null) ? 'Debe seleccionar un cliente' : null;
      },
      decoration: const InputDecoration(
          labelText: 'Cliente', border: OutlineInputBorder()),
    );
  }

  Widget textFormProducto() {
    return TextFormField(
      controller: descripcionController,
      decoration: const InputDecoration(
        labelText: 'Producto',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty) ? "Debe agregar un nombre de producto" : null;
      },
    );
  }

  Widget textFormPrecio() {
    return TextFormField(
      controller: precioController,
      decoration: const InputDecoration(
        labelText: 'Precio',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty) ? "Debe agregar un valor númerico" : null;
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget textFormCantidad() {
    return TextFormField(
      controller: cantidadController,
      decoration: const InputDecoration(
        labelText: 'Cantidad',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return (value!.isEmpty) ? "Debe agregar un valor númerico" : null;
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget radioFormaPago() {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Forma de pago',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Column(
          children: [
            RadioListTile(
              title: Text('Contado'),
              value: 'Contado',
              groupValue: formaPago,
              onChanged: (value) {
                setState(() {});
                formaPago = value ?? 'Contado';
              },
            ),
            RadioListTile(
              title: Text('Débito'),
              value: 'Débito',
              groupValue: formaPago,
              onChanged: (value) {
                setState(() {});
                formaPago = value ?? 'Contado';
              },
            ),
            RadioListTile(
              value: 'Crédito',
              groupValue: formaPago,
              title: Text('Crédito'),
              onChanged: (value) {
                setState(() {});
                formaPago = value ?? 'Contado';
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget textFormFecha() {
    return TextFormField(
      controller: fechaController,
      decoration: const InputDecoration(
        labelText: 'Fecha de Venta',
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? fechaPicker = await showDatePicker(
            context: context,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
            initialDate: DateTime.now());
        if (fechaPicker != null) {
          String fecha = DateFormat('yyyy-MM-dd').format(fechaPicker);
          fechaController.text = fecha;
          setState(() {});
        } else {
          print('No se ha seleccionado ninguna fecha');
        }
      },
    );
  }

  Widget switchConfirmado() {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: "Estado de la Venta",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: SwitchListTile(
        title: const Text("Confirmada ?"),
        value: confirmado,
        onChanged: (value) {
          confirmado = value;
          setState(() {});
        },
      ),
    );
  }

  Widget buttonGuardar() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }else{
              VentaService.insert(venta());
              print(venta().toString());
            }

          },
          child: const Text(
            "Guardar",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          ),
    );
  }
  Venta venta(){
    return Venta(
      nombreCliente: cliente,
      nombreProducto: descripcionController.text,
      precio: double.parse(precioController.text),
      cantidad: int.parse(cantidadController.text),
      formaPago: formaPago,
      fechaVenta: fechaController.text,
      confirmado: confirmado);
  }


}
