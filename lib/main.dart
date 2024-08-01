// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_practice/API%20with%20bloc/features/posts/bloc/posts_bloc.dart';
import 'package:bloc_practice/favourite%20app/bloc/favourite_bloc.dart';
import 'package:bloc_practice/favourite%20app/repository/favourite_repository.dart';
import 'package:bloc_practice/favourite%20app/screens/favourite_screen.dart';
import 'package:bloc_practice/switch%20and%20slider/bloc/switch_and_slider_bloc.dart';
import 'package:bloc_practice/to%20do%20app/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image picker/bloc/image_picker_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (context) => PostsBloc(),
        ),
        BlocProvider<OpacityBloc>(
          create: (context) => OpacityBloc(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider<CameraCaptureBloc>(
          create: (context) => CameraCaptureBloc(),
        ),
        BlocProvider<PickFromGalleryBloc>(
          create: (context) => PickFromGalleryBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (context) => FavouriteBloc(FavouriteRepository()),
        ),
       
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Shop',
        theme: ThemeData(
brightness: Brightness.dark
        ),
        // onGenerateRoute: appRouter.onGenerateRoutes,
        home:const FavouriteScreen(),
      ),
    );
  }
}
