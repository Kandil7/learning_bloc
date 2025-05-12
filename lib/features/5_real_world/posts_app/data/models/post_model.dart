import '../../domain/entities/post.dart';

/// Post model
///
/// This class is a model of the Post entity for the data layer.
/// It extends the Post entity and adds JSON serialization/deserialization.
class PostModel extends Post {
  /// Create a new post model
  const PostModel({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          body: body,
        );
  
  /// Create a post model from a JSON map
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
  
  /// Convert the post model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
