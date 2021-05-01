import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) => setState(() {
          _nombre = valor;
        }),
    );

  }

  Widget _crearEmail(){

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );

  }

  Widget _crearPassword(){
    
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState((){
        _email = valor;
      }),
    );

  }

  Widget _crearFecha(BuildContext context){

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_view_day),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        //Para deshabilitar el focus
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate(context);

      },
    );

  }

  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
      );

    if(picked != null){
      setState(() {
        _fecha = picked.day.toString() + '/' + picked.month.toString() + '/' + picked.year.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
  
 //Método para cargar el listado de opciones
 List<DropdownMenuItem<String>> _getOpcionesDropDown(){
   
   List<DropdownMenuItem<String>> lista = [];

   _poderes.forEach((poder) {
     lista.add(DropdownMenuItem(
       child: Text(poder),
       value: poder,
     ));
   });

   return lista;
 }
 
 Widget _crearDropdown(){
   return Row(
     children: <Widget>[
       Icon(Icons.select_all),
       SizedBox(width: 30.0),
       Expanded(
         child: DropdownButton(
           value: _opcionSeleccionada,
           items: _getOpcionesDropDown(),
           onChanged: (opt){
             setState(() {
               _opcionSeleccionada = opt;
             });
           },
         ),
       )
     ],
   );
 } 
  
  Widget _crearPersona(){

    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );

  }
}