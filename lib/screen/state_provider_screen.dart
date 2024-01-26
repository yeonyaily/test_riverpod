import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/common/layout/default_layout.dart';
import 'package:test_riverpod/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(numberProvider.notifier)
                    .update((state) => state + 1),
                child: Text('UP'),
              ),
              ElevatedButton(
                onPressed: () => ref.read(numberProvider.notifier).state--,
                child: Text('Down'),
              ),
            ],
          ),
        ));
  }
}
