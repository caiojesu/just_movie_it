import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_movie_it/core/configs/injection/injection.dart';
import 'package:just_movie_it/core/network/network_info.dart';
import 'package:just_movie_it/core/services/http/http_client.dart';
import 'package:just_movie_it/features/movies/domain/repositories/movie_repository.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
