// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_practice/simple%20shop/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/simple%20shop/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/simple%20shop/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_practice/simple%20shop/router/router.dart';
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
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<WishlistBloc>(
          create: (context) => WishlistBloc(),
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
