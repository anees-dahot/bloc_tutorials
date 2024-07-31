import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favourite_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FavouriteInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            bloc: context.read<FavouriteBloc>(),
            builder: (context, state) {
              return Visibility(
                visible: state is DataLoadedState && state.temItems.isNotEmpty,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItem());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
          )
        ],
      ),
      body: BlocConsumer(
        bloc: context.read<FavouriteBloc>(),
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is DataLoadedState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final items = state.items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Checkbox(
                        value: state.temItems.contains(items) ? true : false,
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read<FavouriteBloc>()
                                .add(SelectItem(itemsModel: items));
                          } else {
                            context
                                .read<FavouriteBloc>()
                                .add(UnSelectItem(itemsModel: items));
                          }
                        },
                      ),
                      title: state.temItems.contains(items)
                          ? Text(items.title,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red
                              ))
                          : Text(items.title),
                      trailing: IconButton(
                        icon: Icon(
                          items.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: items.isFavourite ? Colors.red : null,
                        ),
                        onPressed: () => context
                            .read<FavouriteBloc>()
                            .add(MakeItemFavourite(itemsModel: items)),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
