import 'package:flutter/material.dart';
import 'package:matriculasappg16/models/carrera_model.dart';
import 'package:matriculasappg16/models/institucion_model.dart';
import 'package:matriculasappg16/models/matricula_model.dart';
import 'package:matriculasappg16/models/persona_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<InstitucionModel> instituciones = [];

  void eliminarMatricula(
    InstitucionModel institucion,
    MatriculaModel matricula,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text("Confirmar eliminación"),
              SizedBox(width: 16),
              Icon(Icons.warning, color: Colors.amber),
            ],
          ),
          content: Text(
            "¿Estas seguro de eliminar la matrícula de ${matricula.persona.nombre} ${matricula.persona.apellido}?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                institucion.matriculas.remove(matricula);

                Navigator.pop(context);

                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  // TAREA
  void editarInstitucion(InstitucionModel institucion) {
    final TextEditingController controller = TextEditingController(
      text: institucion.nombre,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar institución"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Nombre de la institución",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                institucion.nombre = controller.text;
                Navigator.pop(context);
                setState(() {});
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

  Widget buildMatriculaTile(
    MatriculaModel matricula,
    InstitucionModel institucion,
  ) {
    return ListTile(
      title: Text("${matricula.persona.nombre} ${matricula.persona.apellido}"),
      subtitle: Text(
        "${matricula.carrera.nombre} - ${matricula.carrera.duracion}",
      ),
      leading: CircleAvatar(
        radius: 25,
        child: Text(matricula.persona.nombre[0]),
      ),
      trailing: IconButton(
        onPressed: () {
          eliminarMatricula(institucion, matricula);
        },
        icon: Icon(Icons.delete, color: Colors.red),
      ),
    );
  }

  Widget _buildCabeceraInstitucion(InstitucionModel institucion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${institucion.nombre} - ${institucion.matriculas.length}"),
        IconButton(
          onPressed: () {
            PersonaModel eliasEstudiante = PersonaModel(
              nombre: "Elias",
              apellido: "Cutire",
              direccion: "Av sosa 123",
            );

            CarreraModel arquiCarrera = CarreraModel("Arquitectura", "5 AÑOS");
            institucion.matriculas.add(
              MatriculaModel(
                fecha: "21/08/26",
                hora: "15;30",
                persona: eliasEstudiante,
                carrera: arquiCarrera,
              ),
            );
            setState(() {});
          },
          icon: Icon(Icons.add),
        ),
        // BOTON DE EDITAR
        IconButton(
          onPressed: () {
            editarInstitucion(institucion);
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget _buildExpansionInstitucion(InstitucionModel institucion) {
    return ExpansionTile(
      title: _buildCabeceraInstitucion(institucion),
      children: institucion.matriculas.map((matricula) {
        return buildMatriculaTile(matricula, institucion);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          instituciones.add(tecsup);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < instituciones.length; i++)
              _buildExpansionInstitucion(instituciones[i]),
          ],
        ),
      ),
    );
  }
}
