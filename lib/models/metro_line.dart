class MetroLine {
  final String name;
  final List<String> stations;
  final String direction1;
  final String direction2;
  final int? sadatIndex;
  final int? nasserIndex;
  final int? alShohadaaIndex;
  final int? attabaIndex;
  final int? cairoUniversityIndex;

  MetroLine({
    required this.name,
    required this.stations,
    required this.direction1,
    required this.direction2,
    this.sadatIndex,
    this.nasserIndex,
    this.alShohadaaIndex,
    this.attabaIndex,
    this.cairoUniversityIndex,
  });
}
