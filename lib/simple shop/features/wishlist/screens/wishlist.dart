import 'package:bloc_practice/simple%20shop/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    context.read<WishlistBloc>().add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer(
        bloc: context.read<WishlistBloc>(),
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is RemoveFromWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Removed from wishlist.')));
          }
        },
        builder: (context, state) {
           if (state is WishlistLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistErrorState) {
            return  Center(
              child: Text(state.error),
            );}
         else if (state is WIshlistDataLoadedSuccessfullyState) {
            return Center(
                child: ListView.builder(
              itemCount: state.groceryModel.length,
              itemBuilder: (context, index) {
                final items = state.groceryModel[index];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.438,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.27,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(items.image),
                            fit: BoxFit
                                .cover, // Ensure the image covers the container
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        items.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(items.description),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rs. ${items.price}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                context.read<WishlistBloc>().add(
                                    RemoveFromWishlistEvent(
                                        groceryModel: items));
                              },
                              icon: const Icon(Icons.favorite)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
          } else {
            return const Text('Nothing Here Buddy.');
          }
        },
      ),
    );
  }
}
