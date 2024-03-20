import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofa/pages/home/widgets/outcome_list_item.dart';
import 'package:mofa/provider/outcome_list.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  void _goToNewOutcome(BuildContext context) {
    context.go('/new-outcome');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outcomes = ref.watch(outcomeListProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MOney FAmily"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: outcomes.when(
          data: (outcomes) {
            return ListView.builder(
              itemCount: outcomes.length,
              itemBuilder: (context, index) {
                return OutcomeListItem(outcome: outcomes[index]);
              },
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToNewOutcome(context),
        tooltip: 'New outcome',
        child: const Icon(Icons.add),
      ),
    );
  }
}
