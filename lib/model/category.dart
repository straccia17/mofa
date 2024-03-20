import 'package:mofa/data/categories.dart';

class Category {
  final String code;
  final String title;

  Category({
    required this.code,
    required this.title,
  });

  factory Category.fromCode(String code) {
    return categories.firstWhere((element) => element.code == code);
  }


  @override
  String toString() {
    return 'Category{code: $code, title: $title}';
  }
}