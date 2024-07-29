import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/API%20with%20bloc/features/posts/model/posts_mode.dart';
import 'package:bloc_practice/API%20with%20bloc/features/posts/repos/posts_repos.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoadingState());
    await Future.delayed(Duration(seconds: 3));
    try {
      var posts = await PostsRepos().getPosts();
      emit(PostsDataLoadedState(postsModel: posts));
    } catch (e) {
      emit(PostsErrorState(error: e.toString()));
    }
  }
}
