// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';

// import 'package:news/core/strings/failures.dart';
// import 'package:news/core/strings/messages.dart';
// import 'package:news/features/posts/domain/entities/post.dart';
// import 'package:news/features/posts/domain/usecases/add_post.dart';
// import 'package:news/features/posts/domain/usecases/delete_post.dart';
// import 'package:news/features/posts/domain/usecases/update_post.dart';
// import 'package:news/features/posts/presentation/blocs/posts/posts_bloc.dart';

// import '../../../../../core/error/failures.dart';

// part 'add_update_delete_post_event.dart';
// part 'add_update_delete_post_state.dart';

// class AddUpdateDeletePostBloc
//     extends Bloc<AddUpdateDeletePostEvent, AddUpdateDeletePostState> {
//   final AddPostUsecase addPost;
//   final UpdatePostUsecase updatePost;
//   final DeletePostUsecase deletePost;

//   AddUpdateDeletePostBloc(
//       {required this.addPost,
//       required this.updatePost,
//       required this.deletePost})
//       : super(AddUpdateDeletePostInitial()) {
//     on<AddUpdateDeletePostEvent>((event, emit) async {
//       if (event is AddPostEvent) {
//         emit(LoadingAddUpdateDeletePostState());
//         final failureOrDoneMessage = await addPost(event.post);
//         ADD_DELETE_UPDATE(failureOrDoneMessage, ADD_SUCCESS_MESSAGE);
//       } else if (event is UpdatePostEvent) {
//         emit(LoadingAddUpdateDeletePostState());
//         final failureOrDoneMessage = await updatePost(event.post);
//         ADD_DELETE_UPDATE(failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE);
//       } else if (event is DeletePostEvent) {
//         emit(LoadingAddUpdateDeletePostState());
//         final failureOrDoneMessage = await deletePost(event.postid);
//         ADD_DELETE_UPDATE(failureOrDoneMessage, DELETE_SUCCESS_MESSAGE);
//       }
//     });
//   }

//   AddUpdateDeletePostState ADD_DELETE_UPDATE(
//       Either<Failure, Unit> either, String message) {
//     return either.fold(
//         (failure) => ErrorAddUpdateDeletePostState(
//               message: _mapFailureToMessage(failure),
//             ),
//         (_) => MessageAddUpdateDeletePostState(message: message));
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return SERVER_FAILURE_MESSAGE;
//       case OfflineFailure:
//         return OFFLINE_FAILURE_MESSAGE;

//       default:
//         return "UnExpected Error, Plase Try Agen Later ";
//     }
//   }
// }
