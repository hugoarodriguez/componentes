import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  final estiloBoton = ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent.shade400),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
            elevation: MaterialStateProperty.all<double>(10.0));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          style: estiloBoton,
          onPressed: () => _mostrarAlert(context),
        )

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){

          Navigator.pop(context);
          
        },
      ),
    );
    
  }

  void _mostrarAlert(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.00)
            ]
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Aceptar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );

      }
    );

  }
}