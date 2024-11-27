import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class ProductoService {
  Future <List<dynamic>> obtenerTodos()async{
    final response = await http.get(Uri.parse('http://10.0.2.2:9090/obtenertodos'));
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
  } else {
      throw Exception('Error al obtener los productos ${response.statusCode}');
    }
  }
  Future <void> delete(int id) async{
    final response = await http.delete(Uri.parse('http://10.0.2.2:9090/eliminar/$id'));
    if(response.statusCode!= 200) {
      throw Exception('Error al eliminar el producto ${response.statusCode}');
    }
  }
 Future <void> insert(Map<String, dynamic> producto)async{ 
      final response = await http.post(Uri.parse('http://10.0.2.2:9090/nuevo'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: json.encode(producto));
      if (response.statusCode != 201) {
        throw Exception('Error agregando producto ${response.statusCode}');
      } 
 }
 Future<void> update(Map<String, dynamic> producto, String id)async{ 
      final response = await http.put(Uri.parse('http://10.0.2.2:9090/editar/$id'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: json.encode(producto));
      if (response.statusCode != 200) {
        throw Exception('Error modificando producto ${response.statusCode}');
      } }
}
