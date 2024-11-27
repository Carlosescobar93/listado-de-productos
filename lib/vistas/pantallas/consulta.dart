import 'package:flutter/material.dart';

import '../../main.dart';

class Consulta extends StatefulWidget {
  static const String Ruta = "/consulta";

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> producto = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de producto'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: const Color.fromARGB(44, 142, 6, 6),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child:Text(
                  '${producto['nombre']}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 10, 98),
                  ),
                ), 
                ),
                
                const SizedBox(height: 8),
                Text("Descripción: ${producto['descripcion']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Precio: \$${producto['precio'].toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Descuento: ${producto['porcentajeDescuento']}%",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [  Text("Existencia: ${producto['existencia']}" ,
                    style: TextStyle(fontSize: 16), ),
                const SizedBox(height: 8),
                Text("Valoración: ${producto['valoracion']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),]),
                const SizedBox(height: 8),
                Text("Categoría: ${producto['categoria']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Marca: ${producto['marca']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Modelo: ${producto['modelo']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Último ingreso: ${producto['ultimoIngreso']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Forma de ingreso: ${producto['formaIngreso']}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Activo: ${producto['activo'] ? "Sí" : "No"}",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Card(
                  child: Image.network(
                  producto['imagen'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.scaleDown,
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
