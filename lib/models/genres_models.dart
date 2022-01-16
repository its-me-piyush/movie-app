class GenresModel {
  final int id;
  final String name;
  bool isSelected;
  GenresModel({
    required this.id,
    required this.name,
    this.isSelected = false,
  });
}
