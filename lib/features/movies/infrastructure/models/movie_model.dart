import 'package:json_annotation/json_annotation.dart';

import 'package:just_movie_it/features/movies/domain/entities/movie_entity.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends MovieEntity {
  const MovieModel({
    required int id,
    required String title,
    required String backdropPath,
    required String posterPath,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          title: title,
          posterPath: posterPath,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
