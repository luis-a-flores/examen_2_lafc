final String table = 'my_table';

class ModelDataBase {
  static final List<String> values = [
    /// Add all fields
    id, nombre, apellidos, usuario, telefono, contrasena, descripcion,
  ];

  static final String id = 'id';
  static final String nombre = 'nombre';
  static final String apellidos = 'apellidos';
  static final String usuario = 'usuario';
  static final String telefono = 'telefono';
  static final String contrasena = 'contrasena';
  static final String descripcion = 'descripcion';
}


class Model {
  final int? id;  //? - control de variables vacias o nulas
  final String nombre;
  final String apellidos;
  final String usuario;
  final String telefono;
  final String contrasena;
  final String descripcion;

  const Model({
    this.id,
    required this.nombre,
    required this.apellidos,
    required this.usuario,
    required this.telefono,
    required this.contrasena,
    required this.descripcion
  });

  //Perder los datos
  Model copy({
    int? id,
    String? nombre,
    String? apellidos,
    String? usuario,
    String? telefono,
    String? contrasena,
    String? descripcion 
  }) =>
      Model(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellidos: apellidos ?? this.apellidos,
        usuario: usuario ?? this.usuario,
        telefono: telefono ?? this.telefono,
        contrasena: contrasena ?? this.contrasena,
        descripcion: descripcion ?? this.descripcion
      );

  static Model fromJson(Map<String, Object?> json) => Model(
    id: json[ModelDataBase.id] as int?,
      nombre: json[ModelDataBase.nombre] as String,
      apellidos: json[ModelDataBase.apellidos] as String,
      usuario: json[ModelDataBase.usuario] as String,
      telefono: json[ModelDataBase.telefono] as String,
      contrasena: json[ModelDataBase.contrasena] as String,
      descripcion: json[ModelDataBase.descripcion] as String
  );

  Map<String, Object?> toJson() => {
    ModelDataBase.id: id,
    ModelDataBase.nombre: nombre,
    ModelDataBase.apellidos: apellidos,
    ModelDataBase.usuario: usuario,
    ModelDataBase.telefono: telefono,
    ModelDataBase.contrasena: contrasena,
    ModelDataBase.descripcion: descripcion
  };
 /* data['respuesta'][2]['name'] = 'alejandro'
  //'''
  {
    header:{status:200,,},
    respuesta:{[
      alumno1: {id:1, name: alejandro, age:27}
      alumno2: {id:1, name: alejandro, age:27}
      alumno3: {id:1, name: alejandro, age:27}
    ]}
  }*/
//'''
}