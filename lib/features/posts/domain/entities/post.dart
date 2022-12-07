import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const PostsEntity({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object?> get props =>
      [title, description, urlToImage, publishedAt, content];
}
