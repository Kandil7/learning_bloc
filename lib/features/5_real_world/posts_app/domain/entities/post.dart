import 'package:equatable/equatable.dart';

/// Post entity
///
/// This class represents a post entity in the domain layer.
/// It contains the basic properties of a post.
class Post extends Equatable {
  /// The unique identifier of the post
  final int id;
  
  /// The user ID of the post author
  final int userId;
  
  /// The title of the post
  final String title;
  
  /// The body content of the post
  final String body;
  
  /// Create a new post entity
  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
  
  @override
  List<Object> get props => [id, userId, title, body];
}
