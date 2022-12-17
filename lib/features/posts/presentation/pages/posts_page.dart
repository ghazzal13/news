import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../blocs/posts/posts_bloc.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/post_list_widget.dart';

class NewsPage extends StatefulWidget {
  final String country;
  const NewsPage({Key? key, required this.country}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState(country: country);
}

class _NewsPageState extends State<NewsPage> {
  Future<void> get(String c) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('country', c);
    sherad();
  }

  var vv;
  Future<void> sherad() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      vv = prefs.getString('country') ?? 'us';
    });
  }

  @override
  void initState() {
    super.initState();
    sherad();
  }

  String country;
  _NewsPageState({required this.country});

  @override
  Widget build(BuildContext context) {
    var dropdownValue = vv;
    return Scaffold(
      appBar: _buildAppbar(
        dropdownValue,
      ),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar(dropdownValue) => AppBar(
        title: const Text('News',
            style: TextStyle(
                color: Color.fromRGBO(255, 125, 0, 1),
                fontWeight: FontWeight.bold)),
        actions: [
          SizedBox(
            width: 60,
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 1,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              onChanged: (String? newValue) {
                dropdownValue = newValue!;
                setState(() {
                  get(newValue).then((value) => {
                        BlocProvider.of<PostsBloc>(context)
                            .add(RefreshPostsEvent())
                      });
                });
              },
              items: <String>[
                'us',
                'fr',
                'ae',
                'it',
                'pt',
                'ru',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 125, 0, 1),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: PostListWidget(posts: state.posts));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    setState(() {
      BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
    });
  }
}
