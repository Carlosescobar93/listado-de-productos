import 'package:flutter/material.dart';
import 'package:parcia1/vistas/pantallas/pantallas.dart';

class Rutasapp {
  static const inialRouute = 'Listado';
  static Map<String, Widget Function(BuildContext) > Rutas = {
    'Listado' : (context) =>Listado(),
    'formulario' : (context) =>Formulario(),
    'consulta' : (context) =>Consulta(),
  } ;
}