import 'package:flutter/material.dart';
import 'package:examen_2_lafc/home.dart';
import 'package:examen_2_lafc/registro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}
List<String> datos = ['usuario','telefono',"contraseña"];
class _MyWidgetState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: size.height * .4),
                    Texts(
                      titulo: datos[0],
                      icono: Icon(Icons.account_circle),
                    ),
                    SizedBox(height: 20),
                    Texts(
                      titulo: datos[1],
                      icono: Icon(Icons.phone),
                    ),
                    SizedBox(height: 20),
                    Texts(
                      titulo: datos[2],
                      icono: Icon(Icons.password),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));
                    }, 
                    child: const Text('Iniciar Sesion')),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Registro()));
                      },
                      child: const Text('registrarse'),
                    )
                  ]     
                )     
              ],
            )
          )
        ],
      ),
    );
  }
}

class Texts extends StatelessWidget {
  const Texts({
    super.key,
    required this.titulo,
    required this.icono,
  });

  final String titulo;
  final Icon icono;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: titulo,
        fillColor: Colors.white,
        prefixIcon:icono,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        filled: true,     
        )
      );
  }
}