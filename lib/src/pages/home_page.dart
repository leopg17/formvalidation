import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductoProvider();
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body:  _crearListado(),
      floatingActionButton: _crearBoton(context),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Text('Email: ${bloc.email}'),
      //     Divider(),
      //     Text('Password: ${bloc.password}'),
      //   ]
      // ),
      
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=>Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if(snapshot.hasData){
          return Container();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}