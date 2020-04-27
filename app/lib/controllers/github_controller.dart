import 'package:dio/dio.dart';
import 'package:github_repos/models/User.dart';
import 'package:github_repos/models/Repository.dart';

class GithubController {
  Dio dio;

  GithubController(this.dio);

  Future<User> getUser({String username}) async {
    Response response = await dio.get('/users/$username');

    return User.fromJson(response.data);
  }

  Future<List<Repository>> getRepositories({String username}) async {
    Response response = await dio.get('/users/$username/repos');

    return (response.data as List)
        .map(
          (data) => Repository.fromJson(data),
        )
        .toList();
  }

  Future<Repository> getRepository({String fullRepoName}) async {
    Response response = await dio.get('/repos/$fullRepoName');

    return Repository.fromJson(response.data);
  }
}
