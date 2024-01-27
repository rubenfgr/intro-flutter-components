import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Page')),
      body: Stack(
        children: [
          _lista(),
          _isLoading
              ? const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(height: 15.0)
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Widget _lista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return Column(
            children: [
              FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$imagen'),
              ),
              SizedBox(height: 10.0)
            ],
          );
        },
      ),
    );
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = Duration(seconds: 2);
    return Future.delayed(duration, () {
      _isLoading = false;

      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
      );

      _agregar10();
    });
  }

  Future<void> _obtenerPagina1() {
    final duration = Duration(seconds: 2);
    return Future.delayed(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
  }
}
