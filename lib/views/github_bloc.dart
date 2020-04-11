import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:github_repos/controllers/github_controller.dart';
import 'package:github_repos/models/Repository.dart';
import 'package:github_repos/models/User.dart';
import 'package:rxdart/subjects.dart';

class GithubBloc extends BlocBase {
  GithubController api;

  GithubBloc(this.api);

  BehaviorSubject _userController = BehaviorSubject.seeded(true);
  Sink get userIn => _userController.sink;
  Stream<User> get userOut => _userController.stream.asyncMap(
        (v) => api.getUser(
          username: v,
        ),
      );

  BehaviorSubject _reposController = BehaviorSubject.seeded(true);
  Sink get reposIn => _reposController.sink;
  Stream<List<Repository>> get reposOut => _reposController.stream.asyncMap(
        (v) => api.getRepositories(
          username: v,
        ),
      );

  BehaviorSubject _repoController = BehaviorSubject.seeded(true);
  Sink get repoIn => _repoController.sink;
  Stream<Repository> get repoOut => _repoController.stream.asyncMap(
        (v) => api.getRepository(
          fullRepoName: v,
        ),
      );

  @override
  void dispose() {
    _userController.close();
    _reposController.close();
    _repoController.close();
    super.dispose();
  }
}
