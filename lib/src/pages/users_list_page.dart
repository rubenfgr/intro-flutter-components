import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/providers/user_provider.dart';

class HttpPage extends StatelessWidget {
  const HttpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http page'),
      ),
      body: _listarUsuarios(),
    );
  }

  Widget _listarUsuarios() {
    return FutureBuilder<List<User>>(
      future: userProvider.obtenerUsuarios(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _crearListaUsuarios(snapshot.data ?? []);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearListaUsuarios(List<User> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        User user = data[index];
        return Column(
          children: [
            ListTile(
              title: Text(user.firstName + ' ' + user.lastName),
              subtitle: Text(user.email),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
              onTap: () {
                //print(user.toString());
                Navigator.pushNamed(context, 'user_form', arguments: user);
              },
            ),
            Divider()
          ],
        );
      },
    );
  }
}
