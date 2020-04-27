import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/models/Repository.dart';
import 'package:github_repos/views/github_bloc.dart';
import 'package:github_repos/widgets/user_widget.dart';

class RepositoryScreen extends StatelessWidget {
  GithubBloc _githubBloc = BlocProvider.getBloc<GithubBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Repo'),
      ),
      body: StreamBuilder<Repository>(
        stream: _githubBloc.repoOut,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          Repository _repository = snapshot.data;
          return ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              UserWidget(
                avatarUrl: _repository.owner.avatarUrl,
                title: _repository.name,
                subtitle: _repository.language,
              ),
            ],
          );
        },
      ),
    );
  }
}
