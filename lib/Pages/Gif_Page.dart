// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:gyphi/Models/ModeloGif.dart';
import 'package:gyphi/Providers/Gif_Provider.dart';

class GifPage extends StatefulWidget {
  const GifPage({Key? key}) : super(key: key);

  @override
  State<GifPage> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  final gifsprovider = GifProvider();
  late Future<List<ModeloGif>> _listadoGifs;

  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _listadoGifs = gifsprovider.getGifs(_offset);
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Lógica para cargar más GIFs
      if (!_isLoading) {
        setState(() {
          _isLoading = true;
        });

        // Cargar más GIFs y actualizar el offset
        _listadoGifs.then((list) {
          gifsprovider.getGifs(_offset).then((newGifs) {
            setState(() {
              list.addAll(newGifs);
              _offset += newGifs.length;
              _isLoading = false;
            });
          });
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🥸 GIPHY"),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: _listadoGifs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  controller: _scrollController,
                  crossAxisCount: 2,
                  children: ListGifs(snapshot.data as List<ModeloGif>),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

List<Widget> ListGifs(List<ModeloGif> data) {
  List<Widget> gifs = [];
  for (var gif in data) {
    final String url = gif.images?.downsized?.url as String;

    gifs.add(Card(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Image.network(
            url,
            fit: BoxFit.fill,
          ))
        ],
      ),
    ));
  }

  return gifs;
}
