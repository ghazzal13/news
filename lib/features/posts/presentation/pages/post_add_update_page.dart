// import 'package:news/features/posts/presentation/blocs/add_update_delete_post/add_update_delete_post_bloc.dart';

// import '../../../../core/widgets/loading_widget.dart';
// import 'posts_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/util/snackbar_message.dart';
// import '../../domain/entities/post.dart';
// import '../widgets/post_add_update_page/form_widget.dart';

// class PostAddUpdatePage extends StatelessWidget {
//   final PostsEntity? post;
//   final bool isUpdatePost;
//   const PostAddUpdatePage({Key? key, this.post, required this.isUpdatePost})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppbar(),
//       body: _buildBody(),
//     );
//   }

//   AppBar _buildAppbar() {
//     return AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));
//   }

//   Widget _buildBody() {
//     return Center(
//       child: Padding(
//           padding: const EdgeInsets.all(10),
//           child:
//               BlocConsumer<AddUpdateDeletePostBloc, AddUpdateDeletePostState>(
//             listener: (context, state) {
//               if (state is MessageAddUpdateDeletePostState) {
//                 SnackBarMessage().showSuccessSnackBar(
//                     message: state.message, context: context);
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (_) => const NewsPage()),
//                     (route) => false);
//               } else if (state is ErrorAddUpdateDeletePostState) {
//                 SnackBarMessage().showErrorSnackBar(
//                     message: state.message, context: context);
//               }
//             },
//             builder: (context, state) {
//               if (state is LoadingAddUpdateDeletePostState) {
//                 return const LoadingWidget();
//               }

//               return FormWidget(
//                   isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
//             },
//           )),
//     );
//   }
// }
