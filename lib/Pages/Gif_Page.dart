// ignore_for_file: non_constant_identifier_names, unused_local_variable

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listadoGifs = gifsprovider.getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
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
    )));
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
