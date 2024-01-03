import 'package:bloctutorials/bloc/products_bloc.dart';
import 'package:bloctutorials/debug/bloc_observer.dart';
import 'package:bloctutorials/repo/products_repo.dart';
import 'package:bloctutorials/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(RepositoryProvider(
      create: (context) =>ProductsRepo(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(ProductsRepo()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: false,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
