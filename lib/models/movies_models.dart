class MoviesModel {
  final int id;
  final double voteAverage;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String backdropPath;
  final List<int> genreIds;
  MoviesModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.backdropPath,
    required this.genreIds,
  });
}
