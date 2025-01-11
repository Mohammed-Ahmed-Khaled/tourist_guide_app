class GovernmentModel {
  final String id;
  final String name;
  final String imgUrl;
  final String about;
  final List<Map<String, dynamic>> landmarks;

  GovernmentModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.about,
    required this.landmarks,
  });
}
