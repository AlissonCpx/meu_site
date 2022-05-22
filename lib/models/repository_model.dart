class RepositoryModel {
  var name;
  var url;
  var avatarUrl;
  var createdAt;
  var updatedAt;
  var pushedAt;
  var description;

  RepositoryModel({ required this.createdAt, required this.updatedAt, required this.pushedAt, required this.description,
      required this.name, required this.url, required this.avatarUrl});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
        name: json['name'],
        url: json['html_url'],
        avatarUrl: json['svn_url'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        pushedAt: json['pushed_at'],
        description: json['description'],
    );
  }
}
