import 'package:json_annotation/json_annotation.dart';

import 'package:just_movie_it/features/movies/domain/entities/movie_entity.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends MovieEntity {
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  const MovieModel({
    required int id,
    required String title,
    required this.backdropPath,
    required this.posterPath,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          title: title,
          posterPath: posterPath,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  MovieEntity toEntity() => MovieEntity(
        id: id,
        title: title,
        backdropPath: backdropPath,
        posterPath: posterPath,
      );
}
