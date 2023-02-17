class NotesModel {
  String? id;
  String? userid;
  String? title;
  String? content;
  DateTime? dateadded;
  NotesModel({this.id, this.userid, this.title, this.content, this.dateadded});

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      id: map["id"],
      userid: map["mapuserid"],
      title: map["title"],
      content: map["content"],
      dateadded: DateTime.now(),
      //  DateTime.tryParse(map["dateadded"]) ?? 
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userid": userid,
      "title": title,
      "content": content,
      "dateadded":
          dateadded == null ? DateTime.now() : dateadded!.toIso8601String(),
    };
  }
}
