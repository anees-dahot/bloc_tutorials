import 'package:bloc_practice/simple%20shop/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/simple%20shop/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeProductWishlistButtonNavigateClickedEvent());
                },
                icon: const Icon(Icons.favorite_outline)),
            IconButton(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeProductCartButtonNavigateClickedEvent());
                },
                icon: const Icon(Icons.shopping_bag_outlined))
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            if (state is HomeProductCartButtonNavigateClickedState) {
              Navigator.pushNamed(context, '/cart');
            } else if (state is HomeProductWishlistButtonNavigateClickedState) {
              Navigator.pushNamed(context, '/wishlist');
            } else if (state is HomeProductWishlestedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to wishlist!')));
            } else if (state is HomeProductCartedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart!')));
            }
          },
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeErrorState) {
              return const Center(
                child: Text('Error Occured.'),
              );
            } else if (state is HomeProductSuccessfullyLoadedState) {
              final groceryItem = state.grocery;
              return Center(
                  child: ListView.builder(
                itemCount: groceryItem.length,
                itemBuilder: (context, index) {
                  final item = groceryItem[index];
                  return ProductCard(groceryModel: item);
                },
              ));
            } else {
              return const Text('Nothing Here Buddy.');
            }
          },
        ));
  }
}
