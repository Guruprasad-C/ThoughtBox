import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Note {
  Note({required this.title, required this.note, required this.date})
    : id = Uuid().v4();

  String title;
  String note;
  String id;
  DateTime date;

  String get formater {
    return formatter.format(date);
  }
}
