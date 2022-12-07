part of 'posts_bloc.dart';

class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  final List<PostsEntity> posts;

  LoadedPostsState({required this.posts});
  @override
  List<Object> get props => [posts];
}

class ErrorPostsState extends PostsState {
  final String message;

  ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
