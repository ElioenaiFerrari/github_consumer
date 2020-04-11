import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/config/ClientHttp.dart';
import 'package:github_repos/controllers/github_controller.dart';
import 'package:github_repos/models/Repository.dart';
import 'package:github_repos/models/User.dart';

main() {
  ClientHttp clientHttp = ClientHttp();
  GithubController githubController = GithubController(clientHttp.getClient());

  test(
    'get user by username - GithubController',
    () async {
      User user = await githubController.getUser(
        username: 'ElioenaiFerrari',
      );

      expectLater(user.login.isNotEmpty, true);
    },
  );

  test(
    'get repositories - GithubController',
    () async {
      List<Repository> repositories = await githubController.getRepositories(
        username: 'ElioenaiFerrari',
      );

      expectLater(repositories[0].id != null, true);
    },
  );

  test(
    'get repository - GithubController',
    () async {
      Repository repository = await githubController.getRepository(
        fullRepoName: 'ElioenaiFerrari/animations',
      );

      expectLater(repository.name.isNotEmpty, true);
    },
  );
}
