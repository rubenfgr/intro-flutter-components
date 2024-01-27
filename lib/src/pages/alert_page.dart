import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alert Page'),
        ),
        body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                  elevation: 10.0),
              child: const Text(
                'Mostrar alerta',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _mostrarAlerta(context)),
        ));
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: const Text('Título'),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Este es el contenido de la caja de la alerta'),
                  FlutterLogo(
                      size: 100.0), // FlutterLogo es un widget de prueba
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ]);
        });
  }
}
