import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../domain/entities/post.dart';
import '../../pages/post_detail_page.dart';

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
        return InkWell(
          onTap: () {
            print(posts[index].content);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailPage(
                  post: posts[index],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Container(
                  height: 150.0,
                  width: 150.0,
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
                  width: 8.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: Colors.black,
                            fontSize: 16,
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              timeago.format(DateTime.parse(
                                      posts[index].publishedAt)) ??
                                  'day ago',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
