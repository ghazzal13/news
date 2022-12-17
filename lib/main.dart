import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_theme.dart';
import 'features/posts/di/posts_injector.dart' as di;
import 'features/posts/presentation/blocs/posts/posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var country;
  Future<void> sherad() async {
    final prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country') ?? 'us';
  }

  @override
  void initState() {
    super.initState();
    sherad();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'News',
        home: NewsPage(country: country),
      ),
    );
  }
}
