import 'dart:ui';

import 'package:flutter/material.dart';

import '../../service/producto_service.dart';
import '../componentes/componentes.dart';
const List<String> categorias = <String>[
  'Electrodomestico',
  'Audio',
  'Video',
  'Almacenamiento',
  'Periferico',
  'Computadores',
  'Accesorios',
];
class Formulario extends StatelessWidget {
  static const String Ruta = "/formulario"; 

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> producto = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulario Producto',
          style: TextStyle(color: Color.fromARGB(255, 43, 42, 44)),
        ),
        centerTitle: true,
      ),
      body: Cuerpo(producto: producto),
    );
  }
}

class Cuerpo extends StatefulWidget {
  final Map<String,dynamic> producto;

  const Cuerpo({Key? key, required this.producto}) : super(key: key);

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  ProductoService productoService =  ProductoService();
  String id = "";
  final nombreProducto = TextEditingController();
  final descripcion = TextEditingController();
  final precio = TextEditingController();
  final existencia = TextEditingController();
  final descuento = TextEditingController();
  final valoracion = TextEditingController();
  final marca = TextEditingController();
  final modelo = TextEditingController();
   String formaIngreso = "Compra"; 
  String categoriaInicial = categorias.first;
  final ultimoIngresoController =  TextEditingController();
  bool activo = true;
  final imagen = TextEditingController();
  final _formKey = GlobalKey<FormState>();


inicializar(Map<String,dynamic> producto){
  if(producto!= null){
    id = producto['id'].toString();
    nombreProducto.text = producto['nombre']?? "";
    descripcion.text = producto['descripcion']?? "";
    precio.text = producto['precio'].toString();
    existencia.text = producto['existencia'].toString();
    descuento.text = producto['porcentajeDescuento'].toString();
    valoracion.text = producto['valoracion'].toString();
    marca.text = producto['marca']?? "";
    modelo.text = producto['modelo']?? "";
    formaIngreso=producto['formaIngreso'] ?? "" ;
    categoriaInicial=producto['categoria'] ?? "";
    ultimoIngresoController.text = producto['ultimoIngreso']?? "";
    activo = producto['activo']? true : false;
    imagen.text = producto['imagen'];
  }}
  @override
  void initState() {
    if (widget.producto.isNotEmpty) {
      inicializar(widget.producto);
    }
    super.initState();
}
Map<String,dynamic>toMap(){
  return{
  'nombre': nombreProducto.text,
  'descripcion':descripcion.text,
  'precio' :double.parse( precio.text),
  'existencia':int.parse(existencia.text),
  'porcentajeDescuento':int.parse(descuento.text) ,
  'valoracion':int.parse(valoracion.text) ,
  'marca':marca.text,
  'modelo':modelo.text,
  'formaIngreso':formaIngreso,
  'categoria':categoriaInicial,
  'ultimoIngreso': ultimoIngresoController.text,
  'activo':activo,
  'imagen':imagen.text,
};}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EntradaTexto(label: "Nombre del producto",controller: nombreProducto,validate:validarEntradaText),
            const SizedBox(height: 20),
            EntradaTexto(label: 'Descripción',controller: descripcion,validate:validarEntradaText),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                   child:categoriasSelec(),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Fecha(controller: ultimoIngresoController,)
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: EntradaTexto(label: 'Precio',keyboardType: TextInputType.number,controller: precio,validate: validarEntradaNumero,),
                ),
                const SizedBox(width: 10),
                Flexible(
                  
                  child:EntradaTexto(label: '% descuento',keyboardType:TextInputType.number,controller: descuento,validate: validarDescuento,),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: EntradaTexto(label: 'Existencia',controller: existencia,validate: validarEntradaNumero,keyboardType:TextInputType.number),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child:EntradaTexto(label: 'Valoracion (1-10)',controller: valoracion,validate: validarValoracion,keyboardType:TextInputType.number),
                ),
              ],
            ),
            const SizedBox(height: 20),
            EntradaTexto(label: 'Marca',controller: marca,validate:validarEntradaText),
            const SizedBox(height: 20),
            EntradaTexto(label: 'Modelo',controller: modelo,validate:validarEntradaText),
            const SizedBox(height: 20),
           Container(
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: 'Forma de ingreso',
            contentPadding:
                EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        child: Column(
          children: [
            RadioListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text('Compra'),
              value: 'Compra',
              groupValue: formaIngreso,
              onChanged: (value) {
                setState(() {
                  formaIngreso = value ?? 'Compra';
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text('Intercambio'),
              value: 'Intercambio',
              groupValue: formaIngreso,
              onChanged: (value) {
                setState(() {
                  formaIngreso = value ?? 'Compra';
                });
              },
            )
          ],
        ),
      ),
    ),
            const SizedBox(height: 20),
            RadioB(activo: activo),
            const SizedBox(height: 20),
            EntradaTexto(label: 'URL de la imagen',controller: imagen,keyboardType: TextInputType.url,),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 1.0,
              child: ElevatedButton(onPressed: (){
                if (!_formKey.currentState!.validate()) {
                  return ;
                }else{
                  if (widget.producto['id'] == null) {
                     print("-----------------------------------${toMap()}----------------------------${widget.producto['categoria']}----------------------------------------------");
                    ProductoService().insert(toMap());
                  } else {
                  print("-----------------------------------${toMap()}----------------------------${widget.producto['categoria']}----------------------------------------------");
                    productoService.update(toMap(), id);
                  }
                  Navigator.pop(context);
                }
                print(toMap());
              }, child: Text('Guardar')),
            )
          ],
        ),
      ),
    );
  }
  String? validarEntradaText(value){
    if (value.isEmpty) {
      return "Debe ingresar un valor";
    } else if (value.length < 4) {
      return "El valor debe tener al menos 4 caracteres";
    }  else {
      return null;
    }
  }
  String? validarEntradaNumero(value){
    if (value.isEmpty || int.parse(value) < 0)  {
      return "Debe ingresar un valor";
    }  else {
      return null;
    }
  }
  String? validarValoracion(value){
    if (value.isEmpty) {
      return "Debe ingresar un valor";
    } else if (int.parse(value) < 1 || int.parse(value) > 10) {
      return "El valor debe estar entre 1 y 10";
    } else {
      return null;
    }
  }
  String? validarDescuento(value){
    if (value.isEmpty) {
      return "Debe ingresar un valor";
    } else if (int.parse(value) < 0 || int.parse(value) > 100) {
      return "El valor debe estar entre 0 y 100";
    } else {
      return null;
    }
  }
  Widget categoriasSelec(){
    return DropdownButtonFormField(
      items: categorias.map(
        (cate) {
          return DropdownMenuItem(value: cate, child: Text(cate));
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          categoriaInicial = value as String;
        });
      },
      decoration: InputDecoration(
        labelText: 'Seleccione la categoria',
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        value == null ? 'Debe seleccionar una categoria' : null;
      },
    );
  }
}

