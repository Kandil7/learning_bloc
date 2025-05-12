import 'package:equatable/equatable.dart';

/// Base class for all post events
///
/// This abstract class is extended by all post events.
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch all posts
///
/// This event is dispatched when the user wants to fetch all posts.
class FetchPostsEvent extends PostEvent {
  const FetchPostsEvent();
}

/// Event to fetch a post by ID
///
/// This event is dispatched when the user wants to fetch a post by ID.
class FetchPostEvent extends PostEvent {
  /// The ID of the post to fetch
  final int id;

  /// Create a new fetch post event
  const FetchPostEvent(this.id);

  @override
  List<Object> get props => [id];
}

/// Event to refresh posts
///
/// This event is dispatched when the user wants to refresh the posts.
class RefreshPostsEvent extends PostEvent {
  const RefreshPostsEvent();
}
