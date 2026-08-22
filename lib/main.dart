import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaContador(),
    );
  }
}

// Cambio de numeros
class PantallaContador extends StatefulWidget {
  const PantallaContador({super.key});

  @override
  State<PantallaContador> createState() => _PantallaContadorState();
}

class _PantallaContadorState extends State<PantallaContador> {
  // contador general
  int contadorGeneral = 0;

  //contadores abajo
  int contador1 = 0;
  int contador2 = 0;
  int contador3 = 0;
  int contador4 = 0;
  int contador5 = 0;

  // funcion reutilizable para todos los contadores
  Widget tarjetaContador(String nombre, int valor, VoidCallback alPresionar) {
    return Column(
      children: [
        Text(nombre, style: TextStyle(color: Colors.amber, fontSize: 18)),
        Text('$valor', style: TextStyle(color: Colors.amber, fontSize: 16)),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: alPresionar,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
          child: Text('add'),
        ),
      ],
    );
  }

  void sumarContador1() {
    setState(() {
      contador1 = contador1 + 1;
      contadorGeneral = contadorGeneral + 1;
    });
  }

  void sumarContador2() {
    setState(() {
      contador2 = contador2 + 1;
      contadorGeneral = contadorGeneral + 1;
    });
  }

  void sumarContador3() {
    setState(() {
      contador3 = contador3 + 1;
      contadorGeneral = contadorGeneral + 1;
    });
  }

  void sumarContador4() {
    setState(() {
      contador4 = contador4 + 1;
      contadorGeneral = contadorGeneral + 1;
    });
  }

  void sumarContador5() {
    setState(() {
      contador5 = contador5 + 1;
      contadorGeneral = contadorGeneral + 1;
    });
  }

  // resetea todo a 0 otra vez
  void resetearTodo() {
    setState(() {
      contadorGeneral = 0;
      contador1 = 0;
      contador2 = 0;
      contador3 = 0;
      contador4 = 0;
      contador5 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30),

            // contador general
            Text(
              '$contadorGeneral',
              style: TextStyle(
                fontSize: 45,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            // fila con contador1 y contador2, uso la funcion tarjetaContador
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tarjetaContador('Contador1', contador1, sumarContador1),
                tarjetaContador('Contador2', contador2, sumarContador2),
              ],
            ),

            SizedBox(height: 20),
            Divider(color: Colors.grey),
            SizedBox(height: 20),

            // fila con contador3 y contador4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tarjetaContador('Contador3', contador3, sumarContador3),
                tarjetaContador('Contador4', contador4, sumarContador4),
              ],
            ),

            SizedBox(height: 20),
            Divider(color: Colors.grey),
            SizedBox(height: 20),

            // contador5 solo
            tarjetaContador('Contador5', contador5, sumarContador5),

            Spacer(),

            // boton de reseteo
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: resetearTodo,
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'RESET',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
