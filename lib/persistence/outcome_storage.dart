import 'dart:convert';
import 'dart:io';

import 'package:mofa/model/outcome.dart';
import 'package:path_provider/path_provider.dart';

class OutcomeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/outcomes.txt');
  }

  Future<List<Outcome>> load() async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();
      final List<String> lines = content.split('\n');
      return lines.map((e) => Outcome.fromJson(jsonDecode(e))).toList();
    } catch (e) {
      return List.empty();
    }
  }

  Future<File> save(List<Outcome> outcomes) async {
    final file = await _localFile;
    final content = outcomes.map(jsonEncode).join('\n');
    return file.writeAsString(content);
  }
}