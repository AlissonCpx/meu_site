class RepositoryModel {
  final String name;
  final String url;
  final String avatarUrl;

  RepositoryModel(
      {required this.name, required this.url, required this.avatarUrl});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
        name: json['name'] as String,
        url: json['html_url'] as String,
        avatarUrl: json['svn_url'] as String);
  }
}
