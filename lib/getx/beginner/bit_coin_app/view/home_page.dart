import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_practice/getx/beginner/bit_coin_app/widgets/add_asset_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const CircleAvatar(
        child: Icon(Icons.abc),
      ),
      actions: [IconButton(onPressed: () {
      Get.dialog(AddAssetDialog());
      }, icon: const Icon(Icons.add))],
    );
  }
}
