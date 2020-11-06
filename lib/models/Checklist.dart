import 'package:flutter/material.dart';
class Checklist{
  String title;
  bool checked;

  Checklist(this.title, this.checked);
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'checked': checked,
    };
  }
}