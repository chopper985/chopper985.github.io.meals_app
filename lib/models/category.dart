// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
    this.id,
    this.title,
    this.color,
  );

  Category copyWith({
    String? id,
    String? title,
    Color? color,
  }) {
    return Category(
      id ?? this.id,
      title ?? this.title,
      color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color.value,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['id'],
      map['title'],
      Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, title: $title, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Category &&
      other.id == id &&
      other.title == title &&
      other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ color.hashCode;
}
