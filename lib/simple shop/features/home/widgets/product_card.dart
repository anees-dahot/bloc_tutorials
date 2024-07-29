import 'package:bloc_practice/simple%20shop/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc_practice/simple%20shop/models/grocery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final GroceryModel groceryModel;
  const ProductCard({
    super.key,
    required this.groceryModel,
  });

  @override
  Widget build(BuildContext context) {
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
                image: NetworkImage(groceryModel.image),
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            groceryModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(groceryModel.description),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. ${groceryModel.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<HomeBloc>().add(
                                HomeProductWihslistButtonClickedEvent(
                                    groceryModel: groceryModel));
                          },
                          icon: const Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {
                            context.read<HomeBloc>().add(
                                HomeProductCartButtonClickedEvent(
                                    groceryModel: groceryModel));
                          },
                          icon: const Icon(Icons.shopping_bag_outlined)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
