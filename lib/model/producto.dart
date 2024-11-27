import 'dart:ffi';

class Producto {
  int? id = null;
  String nombre = '';
  String descripcion = '';
  double precio = 0;
  int existencia = 0 ;
  double porcentajeDescuento = 0;
  int valoracion = 0;
  String marca = '';
  String modelo = '';
  String formaIngreso = '';
  String categoria = '';
  String ultimoIngreso = ''; 
  bool activo = true;
  String imagen = '';
  
  Producto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.existencia,
    required this.porcentajeDescuento,
    required this.valoracion,
    required this.marca,
    required this.modelo,
    required this.formaIngreso,
    required this.categoria,
    required this.ultimoIngreso,
    required this.activo,
    required this.imagen,
  });
Producto.empty();
  @override
  String toString() {
    return 'Producto{id: $id, nombre: $nombre, descripcion: $descripcion, precio: $precio, existencia: $existencia, porcentajeDescuento: $porcentajeDescuento, valoracion: $valoracion, marca: $marca, modelo: $modelo, formaIngreso: $formaIngreso, categoria: $categoria, ultimoIngreso: $ultimoIngreso, activo: $activo, imagen: $imagen}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'existencia': existencia,
      'porcentajeDescuento': porcentajeDescuento,
      'valoracion': valoracion,
      'marca': marca,
      'modelo': modelo,
      'formaIngreso': formaIngreso,
      'categoria': categoria,
      'ultimoIngreso': ultimoIngreso,
      'activo': activo,
      'imagen': imagen,
    };
  }
}
