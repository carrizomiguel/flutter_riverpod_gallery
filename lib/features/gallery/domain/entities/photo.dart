class Photo {
  const Photo({
    required this.id,
    required this.url,
    required this.name,
    required this.date,
  });

  final String id;
  final String url;
  final String name;
  final DateTime date;
}
