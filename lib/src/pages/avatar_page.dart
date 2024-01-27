import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(40.0),
            ),
            margin: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.kd5ocZG4b0nZ7pW4fMYwtQAAAA?rs=1&pid=ImgDetMain'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://th.bing.com/th/id/R.01c7b181419e15cc614b2297a0e0b959?rik=zGf2g7HyblIvTg&riu=http%3a%2f%2fwww.aceshowbiz.com%2fimages%2fstill%2favatar114.jpg&ehk=A2qdetFD%2bCnHXOA868yrfaHHPewee02Hh2kWzPtS81Y%3d&risl=&pid=ImgRaw&r=0'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }
}
