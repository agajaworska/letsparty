import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ThemeModel {
  final String id;
  final String imageUrl;

  ThemeModel({
    required this.id,
    required this.imageUrl,
  });
}
