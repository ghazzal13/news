import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/app_theme.dart';
import '../../../domain/entities/post.dart';

class PostDetailWidget extends StatelessWidget {
  final PostsEntity post;
  const PostDetailWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width - 5,
              height: size.width - 5,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: size.width - 10,
                height: size.width - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      post.urlToImage,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  timeago.format(DateTime.parse(post.publishedAt)) ?? 'day ago',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
            ),
            Text(
              post.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              post.content,
              maxLines: 30,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Divider(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
