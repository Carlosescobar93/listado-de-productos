import 'package:flutter/material.dart';

import '../../service/service.dart';

class Listado extends StatefulWidget {
  const Listado({super.key});

  @override
  State<Listado> createState() => _ListadoState();
}

class _ListadoState extends State<Listado> {
  ProductoService productoService = ProductoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de productos"),
      ),
      body: FutureBuilder(
        future: productoService.obtenerTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Error al cargar los productos: ${snapshot.error}"));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles.'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final producto = snapshot.data![index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    productoService.delete(producto['id']);
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Producto eliminado')),
                    );
                  } else if (direction == DismissDirection.startToEnd) {
                    Navigator.pushNamed(
                      context,
                      'formulario',
                      arguments: producto,
                    ).then((value) => setState(() {}));
                  }
                },
                background: Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    color: Colors.green,
                    child: Column(
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(height: 30),
                        Text("EDITAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
                secondaryBackground: Container(
                  padding: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: Column(
                    children: [
                      const Icon(Icons.delete, color: Colors.white),
                      SizedBox(height: 30),
                      Text("ELIMINANDO .......",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'consulta',
                      arguments: producto,
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      shadowColor: Color.fromRGBO(184, 9, 97, 0.988),
                      elevation: 2,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Producto: ${producto["nombre"]}',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 62, 174, 52)),
                            ),
                            SizedBox(height: 4),
                            Text('Descripción: ${producto["descripcion"]}'),
                            SizedBox(height: 4),
                            Text('Precio: \$ ${producto["precio"]}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, dynamic> producto = {};
          Navigator.pushNamed(context, 'formulario', arguments: producto)
              .then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
