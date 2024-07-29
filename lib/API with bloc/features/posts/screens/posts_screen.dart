import 'package:bloc_practice/API%20with%20bloc/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer(
        bloc: context.read<PostsBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostsErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is PostsDataLoadedState) {
            return Center(
                child: ListView.builder(
              itemCount: state.postsModel.length,
              itemBuilder: (context, index) {
                final posts = state.postsModel[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  width: double.maxFinite,
                 
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                       Text(
                        posts.id.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                        const SizedBox(height: 10,),
                      Text(
                        posts.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        posts.body,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                     
                    ],
                  ),
                );
              },
            ));
          } else {
            return const Center(
              child: Text('Nothing here buddy.'),
            );
          }
        },
      ),
    );
  }
}
