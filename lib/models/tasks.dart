// ignore: camel_case_types
class Tasks {
  String title;
  DateTime date;

  Tasks({required this.title, required this.date});

  Map<String, dynamic> toJSON(Tasks value) {
    return {
      "title": value.title,
      "datetime": value.date.toIso8601String(),
    };
  }
}
