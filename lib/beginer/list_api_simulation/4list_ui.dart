import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/list_api_simulation/3.list_viewmodel.dart';

class ListUi extends ConsumerWidget {
  const ListUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemState = ref.watch(listViewModelProvider);
    final viewModel = ref.read(listViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("List UI"),
      ),
      body: itemState.when(
        error: (error, _) {
          return const Text("Error occured while Fetching the data");
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        data: (items) {
          return Column(
            children: [
              Expanded(
                  child: items.isEmpty
                      ? const Center(
                          child: Text(" No Item Present in the list"),
                        )
                      : ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            var values = items[index];
                            return ListTile(
                              title: Text(values.content),
                            );
                          }))
            ],
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {
            viewModel.addItem("Hola");
          }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(onPressed: () {
            viewModel.removeItem(1);
          }),
        ],
      ),
    );
  }
}
