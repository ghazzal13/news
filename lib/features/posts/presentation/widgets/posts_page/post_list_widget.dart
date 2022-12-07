import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';
import '../../../domain/entities/post.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostListWidget extends StatelessWidget {
  final List<PostsEntity> posts;
  const PostListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      posts[index].urlToImage ??
                          "https://media.zenfs.com/en/thewrap.com/77f44c69591e36044c612c8ce56789a5",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        posts[index].title ??
                            nouns
                                .take(10)
                                .toString()
                                .replaceAll(',', '')
                                .replaceAll(')', '')
                                .replaceAll('(', ''),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        posts[index].description ??
                            nouns
                                .take(12)
                                .toString()
                                .replaceAll(',', '')
                                .replaceAll(')', '')
                                .replaceAll('(', ''),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                timeago.format(DateTime.parse(posts[index].publishedAt)) ??
                    'day ago',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
