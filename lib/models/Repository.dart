import 'package:github_repos/models/User.dart';

class Repository {
  int id;
  String name;
  String fullName;
  bool private;
  User owner;
  String htmlUrl;
  Null description;
  String url;
  String createdAt;
  String updatedAt;
  String pushedAt;
  int size;
  String language;
  int forksCount;
  Null mirrorUrl;
  bool archived;
  bool disabled;
  int openIssuesCount;
  int forks;
  int openIssues;
  int watchers;
  String defaultBranch;

  Repository({
    this.id,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.size,
    this.language,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });

  Repository.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? new User.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    size = json['size'];
    language = json['language'];
    forksCount = json['forks_count'];
    mirrorUrl = json['mirror_url'];
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['private'] = this.private;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['pushed_at'] = this.pushedAt;
    data['size'] = this.size;
    data['language'] = this.language;
    data['forks_count'] = this.forksCount;
    data['mirror_url'] = this.mirrorUrl;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['open_issues_count'] = this.openIssuesCount;
    data['forks'] = this.forks;
    data['open_issues'] = this.openIssues;
    data['watchers'] = this.watchers;
    data['default_branch'] = this.defaultBranch;
    return data;
  }
}
