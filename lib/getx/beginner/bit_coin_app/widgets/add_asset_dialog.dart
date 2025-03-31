import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetDialog extends StatelessWidget {
  const AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.40,
          width: MediaQuery.sizeOf(context).width * 0.8,
          color: Colors.white,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: _buildUi(),
        ),
      ),
    );
  }

  Widget _buildUi() {
    return SizedBox(
      height: 10,
    );
  }
}
