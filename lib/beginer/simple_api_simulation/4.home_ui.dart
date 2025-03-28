import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/simple_api_simulation/3.home_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProivider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: homeState.when(
            data: (data) {
              return Text(data.message);
            },
            error: (error, _) {
              return Text("$error");
            },
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
