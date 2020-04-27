import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/helper/helper.dart';
import 'package:github_repos/models/Repository.dart';
import 'package:github_repos/views/github_bloc.dart';
import 'package:github_repos/views/repository_screen.dart';
import 'package:github_repos/widgets/search_widget.dart';
import 'package:github_repos/widgets/user_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GithubBloc _githubBloc = BlocProvider.getBloc<GithubBloc>();

  TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _githubBloc.reposIn.add('ElioenaiFerrari');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          SearchWidget(
            controller: _usernameController,
            onTap: () {
              _githubBloc.reposIn.add(_usernameController.text);
            },
          ),
          SizedBox(height: 50),
          StreamBuilder<List<Repository>>(
            stream: _githubBloc.reposOut,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<Repository> _repositories = snapshot.data;
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.white,
                  height: 30,
                ),
                itemCount: _repositories.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserWidget(
                    avatarUrl: _repositories[index].owner.avatarUrl,
                    title: _repositories[index].name,
                    subtitle: _repositories[index].owner.login,
                    onTap: () {
                      _githubBloc.repoIn.add(_repositories[index].fullName);
                      Helper.goToScreen(context, screen: RepositoryScreen());
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
