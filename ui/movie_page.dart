import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoviePage extends StatelessWidget {
  final Map _movieData;

  const MoviePage(this._movieData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_movieData['title']),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500${_movieData["backdrop_path"]}',
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red),
                    const SizedBox(width: 8.0),
                    Text(
                      _movieData['vote_average']?.toStringAsFixed(1) ?? '0.0',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Chip(
                  backgroundColor: Colors.red.withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  avatar: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  label: Text(
                    'a',
                    //DateFormat('dd/MM/yyyy').format(_movieData['release_date']),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              _movieData['overview'],
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
