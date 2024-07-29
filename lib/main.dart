// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_practice/API%20with%20bloc/features/posts/bloc/posts_bloc.dart';
import 'package:bloc_practice/API%20with%20bloc/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (context) => PostsBloc(),
        ),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Shop',
        onGenerateRoute: appRouter.onGenerateRoutes,
      ),
    );
  }
}
