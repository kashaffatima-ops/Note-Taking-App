//viewmodel
import 'package:flutter/foundation.dart';
import 'package:notetakingapp/model/note_model.dart';

class NoteViewmodel extends ChangeNotifier {
  List<note> _noteslist = [];

  List<note> get getstaskslist => _noteslist;

  //add task in list
  void addtasks(String title, String des) {
    note taskobj = note(title, des);
    _noteslist.add(taskobj);
  }
}
