import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class RadioB extends StatefulWidget {
  bool activo = false;
   RadioB({super.key,required this.activo});

  @override
  State<RadioB> createState() => _RadioBState();
}

class _RadioBState extends State<RadioB> {
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 62, 97, 22),
                  width: 2,
                ),
              ),
              child: SwitchListTile(
                title: const Text('Activo'),
                value: widget.activo,
                onChanged: (bool nuevoValor) {
                  setState(() {
                   widget.activo = nuevoValor;
                  });
                },
              ),
            );
  }
}


class FormaIngreso extends StatefulWidget {
String _formaIngreso;
 FormaIngreso({super.key, required String formaIngreso})
      : _formaIngreso = formaIngreso;


  @override
  State<FormaIngreso> createState() => _FormaIngresoState();
}

class _FormaIngresoState extends State<FormaIngreso> {
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 62, 97, 22),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  const Text('Forma de ingreso'),
                  RadioListTile<String>(
                    title: const Text('Compra'),
                    value: 'Compra',
                    groupValue: widget._formaIngreso,
                    onChanged: (value) {
                      setState(() {
                        widget._formaIngreso = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Intercambio'),
                    value: 'Intercambio',
                    groupValue: widget._formaIngreso,
                    onChanged: (value) {
                      setState(() {
                        widget._formaIngreso = value!;
                      });
                    },
                  ),
                ],
              ),
          
             );
  }
}

class EntradaTexto extends StatelessWidget {
  final TextEditingController ? controller ;
  final TextInputType keyboardType;
  final String label;
  final String? Function(String?)? validate ;
  const EntradaTexto({super.key, this.controller, required this.label, this.validate, this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:  keyboardType,
      controller: controller,
      validator: validate,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: label,
      ),
    );
  }
}
class Fecha extends StatefulWidget {
  final TextEditingController? controller;
  const Fecha({super.key, this.controller});
  @override
  State<Fecha> createState() => _FechaState();
}
class _FechaState extends State<Fecha> {
  @override
  Widget build(BuildContext context ) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value!.isEmpty ? 'Seleccione una fecha' : null,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: 'Fecha',
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
          widget.controller!.text = fecha;
          setState(() {});
        } else {
          print('No se ha seleccionado ninguna fecha');
        }
      },
    );
  }
  }
  