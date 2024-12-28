class SearchHistory {
  final String firstStation;
  final String lastStation;

  SearchHistory({
    required this.firstStation,
    required this.lastStation,
  });

  // To convert the object to JSON format for storage
  Map<String, String> toJson() { // toJson is a method that is return Map<String, String>
    return {
      'firstStation': firstStation,
      'lastStation': lastStation,
    };
  }

  // Convert JSON to Object 
  factory SearchHistory.fromJson(Map<String, dynamic> json) {
  return SearchHistory(
    firstStation: json['firstStation']?.toString() ?? '',
    lastStation: json['lastStation']?.toString() ?? '',
  );
}
}
