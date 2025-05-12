class PostModel{
  String? title;
  String? body;
  int? userId;
  int? id;

  PostModel({this.title, this.body, this.userId, this.id});

  factory PostModel.fromJson(Map<String, dynamic> json){
    return PostModel(
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      id: json['id']
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'body': body,
      'userId': userId,
      'id': id
    };
  }
}