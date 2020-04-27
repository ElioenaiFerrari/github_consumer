import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/config/ClientHttp.dart';
import 'package:github_repos/controllers/github_controller.dart';
import 'package:github_repos/views/github_bloc.dart';
import 'package:github_repos/views/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      dependencies: <Dependency>[
        Dependency((i) => ClientHttp(), singleton: true),
        Dependency((i) => GithubController(i.get<ClientHttp>().getClient())),
      ],
      blocs: <Bloc>[
        Bloc((i) => GithubBloc(i.get<GithubController>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff24292e),
          primaryColor: Color(0xff24292e),
          accentColor: Color(0xff6f42c1),
          appBarTheme: AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            textTheme: TextTheme(
              title: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff6f42c1),
                width: 2,
              ),
            ),
            labelStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xff6f42c1),
            ),
            subtitle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            button: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
