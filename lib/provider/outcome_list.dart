import 'package:mofa/model/outcome.dart';
import 'package:mofa/persistence/outcome_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'outcome_list.g.dart';

@riverpod
class OutcomeList extends _$OutcomeList {

  final _outcomeStorege = OutcomeStorage();

  @override
  Future<List<Outcome>> build() async {
    return await _outcomeStorege.load();
  }

  Future<void> add(Outcome outcome) async {
    outcome = outcome.copyWith(id: const Uuid().v4());
    final outcomes = [...await future, outcome];
    await _outcomeStorege.save(outcomes);
    state = AsyncData(outcomes);
  }
}
