class TaskModel {
  String id;
  String title;
  String description;
  int data;
  bool isDone;
  String? userid;
  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.data,
    this.isDone = false,
     this.userid
  });
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          isDone: json['isDone'],
          description: json['description'],
          id: json['id'],
          title: json['title'],
          data: json['data'],
          userid: json['userid'],
        );

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "description": description,
      "data": data,
      "title": title,
      "isDone": isDone,
      "userid": userid,
    };
  }
}
