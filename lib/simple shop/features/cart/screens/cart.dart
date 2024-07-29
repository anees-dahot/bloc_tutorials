import 'package:bloc_practice/simple%20shop/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/simple%20shop/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer(
        bloc: context.read<CartBloc>(),
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) {
          if (state is RemoveFromCartActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Removed from cart.')));
          }
        },
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartErrorState) {
            return  Center(
              child: Text(state.error),
            );
          } else if (state is CartDataLoadedSuccessfullyState) {
            return Center(
                child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final items = state.items[index];
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
                                context.read<CartBloc>().add(
                                    RemoveFromCartEvent(
                                        groceryModel: items));
                              },
                              icon: const Icon(Icons.shopping_bag)),
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
