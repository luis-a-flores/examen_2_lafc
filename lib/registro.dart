import 'package:examen_2_lafc/databasehelper.dart';
import 'package:examen_2_lafc/login.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
  await dbHelper.init();
  runApp(const Registro());
}

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _MyWidgetState();
}


class _MyWidgetState extends State<Registro> {


  @override
  Widget build(BuildContext context) {
    final nombre = TextEditingController();
    final apellidos = TextEditingController();
    final usuario = TextEditingController();
    final telefono = TextEditingController();
    final contrasena = TextEditingController();
    final descripcion = TextEditingController();
  
    List<String> datos =['nombre(s)','apellidos(s)','Username','telefono','contraseña','descripcion'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('registro'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Texts(
                  variable: nombre,
                  titulo: datos[0],
                  icono: const Icon(Icons.account_circle),
                  ),
                const SizedBox(height: 20,),
                Texts(
                  variable: apellidos,
                  titulo: datos[1],
                  icono: const Icon(Icons.account_circle)
                  ),
                const SizedBox(height: 20,),
                Texts(
                  variable: usuario,
                  titulo: datos[2],
                  icono: const Icon(Icons.account_circle)
                  ),
                const SizedBox(height: 20,), 
                Texts(
                  variable: telefono,
                  titulo: datos[3],
                  icono: const Icon(Icons.phone)
                ),
                const SizedBox(height: 20),
                Texts(
                  variable: contrasena,
                  titulo: datos[4],
                  icono: Icon(Icons.password),
                ),
                SizedBox(height: 20),
                Texts(
                  variable: descripcion,
                  titulo: datos[5],
                  icono: Icon(Icons.text_fields),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                      Map<String,dynamic> row = {
                        DatabaseHelper.columnNombre: nombre.text,
                        DatabaseHelper.columnApellidos: apellidos.text,
                        DatabaseHelper.columUsuario: usuario.text,
                        DatabaseHelper.columnTelefono: telefono.text,
                        DatabaseHelper.columnContrasena: contrasena.text,
                        DatabaseHelper.columnDescription: descripcion.text
                      };
                      final id = await dbHelper.insert(row);
                      debugPrint('inserted row id $id');
                      if(!id.isNegative){
                        SnackBar(
                          content: Text(
                            'se agrego correctamente el usuario ${nombre.text} con el id: $id'
                          ),
                        );
                      }
                },
                child: const Text('Ingresar')),

                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text('cancelar'),
                )
              
              ]
            )
          )
        ]
      )
    );
  }
}

class Texts extends StatelessWidget {
  const Texts({
    super.key,
    required this.titulo,
    required this.icono,
    required this.variable,
    
  });

  final String titulo;
  final Icon icono;
  final TextEditingController variable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: variable,
      decoration: InputDecoration(
        prefixIcon: icono,
        labelText: titulo,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
          
        )
      ),
    );
  }
}
  
