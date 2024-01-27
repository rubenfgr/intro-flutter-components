import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.photo_album, color: Colors.blue),
              title: Text('Soy el título de esta tarjeta'),
              subtitle: Text(
                  'Aquí estamos con la descripción de la tarjeta que quiero que ustedes vean para tener una idea de lo que quiero mostrarles.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Ok', style: TextStyle(color: Colors.blue)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ));
  }

  Widget _cardTipo2() {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: const EdgeInsets.all(10.0),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            const FadeInImage(
              image: NetworkImage(
                  'https://www.eldiario.es/fotos/Stan-Lee_EDIIMA20181112_0001_19.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
            ),
            const ListTile(
              leading: Icon(Icons.star_border_purple500_outlined,
                  color: Colors.blue),
              title: Text('Stan Lee'),
              subtitle: Text('Creador de Marvel Comics'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Ok', style: TextStyle(color: Colors.blue)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ));
  }
}
