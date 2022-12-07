import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/app_theme.dart';
import 'package:news/features/posts/di/posts_injector.dart' as di;
import 'package:news/features/posts/presentation/pages/posts_page.dart';

import 'features/posts/presentation/blocs/add_update_delete_post/add_update_delete_post_bloc.dart';
import 'features/posts/presentation/blocs/posts/posts_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        // BlocProvider(create: (_) => di.sl<AddUpdateDeletePostBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts',
        home: const NewsPage(),
      ),
    );
  }
}
