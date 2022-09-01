// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  factory PostModel.fromJson(Map json) {
    return PostModel(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }

  @override
  String toString() {
    return 'PostModel( id: $id )';
  }
}
