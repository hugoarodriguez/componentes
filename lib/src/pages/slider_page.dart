import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider'),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),
             _crearCheckBox(),
             _crearSwitch(),
             Expanded(
               child: _crearImagen()
             )
           ]
         ),
       ),
    );
  }

  Widget _crearSlider(){

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearSlider) ? null : (valor){

        setState(() {
          _valorSlider = valor;
        });

      }
    );

  }

  Widget _crearCheckBox(){

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearSlider, 
      onChanged: (valor){
        setState(() {
          _bloquearSlider = valor;
        });
      }
    );

  }

  Widget _crearSwitch(){

    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearSlider,
      onChanged: (valor){
        setState(() {
          _bloquearSlider = valor;
        });
      }
    );

  }
  
  Widget _crearImagen(){

    return FadeInImage(
      image: NetworkImage('http://assets.stickpng.com/images/580b57fbd9996e24bc43c01d.png'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }
}