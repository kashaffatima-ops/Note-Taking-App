import 'package:flutter/foundation.dart';

class note with ChangeNotifier {
  String _title;
  String _description;

//constructor
  note(this._title, this._description);

//getters
  String get title => _title;
  String get description => _description;
}
