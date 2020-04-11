import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/config/ClientHttp.dart';
import 'package:github_repos/controllers/github_controller.dart';
import 'package:github_repos/models/Repository.dart';
import 'package:github_repos/models/User.dart';
import 'package:github_repos/views/github_bloc.dart';

main() {
  ClientHttp clientHttp = ClientHttp();
  GithubController githubController = GithubController(clientHttp.getClient());

  test(
    'get user by username - GithubBloc',
    () async {
      GithubBloc bloc = GithubBloc(githubController);

      bloc.userIn.add('ElioenaiFerrari');

      expectLater(
        bloc.userOut,
        emits(
          (User user) => user.login.isNotEmpty,
        ),
      );
    },
  );

  test(
    'get repositories - GithubBloc',
    () async {
      GithubBloc bloc = GithubBloc(githubController);

      bloc.reposIn.add('ElioenaiFerrari');

      expectLater(
        bloc.reposOut,
        emits(
          (List<Repository> repositories) => repositories.isNotEmpty,
        ),
      );
    },
  );

  test(
    'get repository - GithubBloc',
    () async {
      GithubBloc bloc = GithubBloc(githubController);

      bloc.repoIn.add('ElioenaiFerrari/animations');

      expectLater(
        bloc.repoOut,
        emits(
          (Repository repository) => repository.name.isNotEmpty,
        ),
      );
    },
  );
}
