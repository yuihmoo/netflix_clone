import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/model_movie.dart';
import '../screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  const BoxSlider({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
              '지금 뜨는 콘텐츠'
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(movies, context),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(List<Movie> movies, BuildContext context) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              }));
        },
        child: Container(
          padding: const EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.network(movies[i].poster),
          ),
        ),
      ),
    );
  }
  return results;
}
