
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class GetAllPostsEvent extends PostEvent {
  @override
  List<Object> get props => [];
}
