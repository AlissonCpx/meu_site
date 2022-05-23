class UserModel {
  var login;
  var html_url;
  var avatarUrl;
  var public_repos;


  UserModel({ required this.login, required this.html_url, required this.avatarUrl, required this.public_repos});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        login: json['login'],
        html_url: json['html_url'],
        avatarUrl: json['avatar_url'],
        public_repos: json['public_repos']
    );
  }
}
