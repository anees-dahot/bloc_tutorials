// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDoModel {
  final String title;
  final String body;
   bool isCompleted;

  ToDoModel(
      {required this.title, required this.body, required this.isCompleted});

  ToDoModel copyWith({String? title, String? body, bool? isCompleted}) {
    return ToDoModel(
        title: title ?? this.title,
        body: body ?? this.body,
        isCompleted: isCompleted ?? this.isCompleted);
  }
}
