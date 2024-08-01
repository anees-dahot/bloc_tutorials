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
                    icon: const Icon(
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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: TextField(
                    onChanged: (value) {
                      context
                          .read<FavouriteBloc>()
                          .add(SearchItem(searchQuery: value));
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search with ID',
                        border: OutlineInputBorder()),
                  ),
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty
                      ? Center(
                          child: Text(state.searchMessage.toString()),
                        )
                      : ListView.builder(
                          itemCount: state.searchItems.isEmpty
                              ? state.items.length
                              : state.searchItems.length,
                          itemBuilder: (context, index) {
                            final items = state.searchItems.isEmpty
                                ? state.items[index]
                                : state.searchItems[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: Checkbox(
                                    value: state.temItems.contains(items)
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      if (value!) {
                                        context
                                            .read<FavouriteBloc>()
                                            .add(SelectItem(itemsModel: items));
                                      } else {
                                        context.read<FavouriteBloc>().add(
                                            UnSelectItem(itemsModel: items));
                                      }
                                    },
                                  ),
                                  title: state.temItems.contains(items)
                                      ? Text(items.title,
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.white,
                                              color: Colors.red))
                                      : Text(items.title),
                                  trailing: IconButton(
                                    icon: Icon(
                                      items.isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color:
                                          items.isFavourite ? Colors.red : null,
                                    ),
                                    onPressed: () => context
                                        .read<FavouriteBloc>()
                                        .add(MakeItemFavourite(
                                            itemsModel: items)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
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
