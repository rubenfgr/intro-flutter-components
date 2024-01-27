import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider Page')),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            const Divider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (double valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/jar-loading.gif',
      image:
          'https://th.bing.com/th/id/R.01c7b181419e15cc614b2297a0e0b959?rik=zGf2g7HyblIvTg&riu=http%3a%2f%2fwww.aceshowbiz.com%2fimages%2fstill%2favatar114.jpg&ehk=A2qdetFD%2bCnHXOA868yrfaHHPewee02Hh2kWzPtS81Y%3d&risl=&pid=ImgRaw&r=0',
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (bool? valor) {
    //     setState(() {
    //       _bloquearCheck = valor ?? false;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: const Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (bool? valor) {
        setState(() {
          _bloquearCheck = valor ?? false;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: const Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (bool? valor) {
        setState(() {
          _bloquearCheck = valor ?? false;
        });
      },
    );
  }
}
