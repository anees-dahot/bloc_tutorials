part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsDataLoadedState extends PostsState {
  final List<PostsModel> postsModel;

 const PostsDataLoadedState({required this.postsModel});
}

class PostsErrorState extends PostsState {
  final String error;

  const PostsErrorState({required this.error});
}
