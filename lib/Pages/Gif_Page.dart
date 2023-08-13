// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gyphi/Models/ModeloGif.dart';
import 'package:gyphi/Providers/Gif_Provider.dart';

class GifPage extends StatefulWidget {
  const GifPage({Key? key}) : super(key: key);

  @override
  State<GifPage> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  final ScrollController _scrollCon = ScrollController();
  final gifsprovider = GifProvider();
  late Future<List<ModeloGif>> _listedGifs;
   List<ModeloGif> _loadedGifs = [];
  bool _loadingMore = false;
  int _loadedGifCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listedGifs = gifsprovider.getGifs();
  }
  Future<void> _loadMoreItems() async {
    if (!_loadingMore) {
      setState(() {
        _loadingMore = true;
      });

      final moreGifs = await gifsprovider.getMoreGifs(_loadedGifCount);

      setState(() {
        _loadedGifs.addAll(moreGifs);
        _loadedGifCount += moreGifs.length;
        _loadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollCon.addListener(() {
      if (_scrollCon.position.pixels >=
          _scrollCon.position.maxScrollExtent - 200) {
        _loadMoreItems();
      }
    });
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: FutureBuilder(
        future: _listedGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _loadedGifs = snapshot.data as List<ModeloGif>; 
            return GridView.count(

              controller: _scrollCon,
              crossAxisCount: 2,
              children: ListGifs(_loadedGifs),
              dragStartBehavior: DragStartBehavior.start,
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
            ),
          )
        ],
      ),
    ));
  }

  return gifs;
}
