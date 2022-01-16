class TvItemModel {
  final String backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String voteAverage;
  TvItemModel({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });
}
