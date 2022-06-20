import 'package:flutter/material.dart';
import 'customButton.dart';

class BranchINR extends StatefulWidget {
  const BranchINR({Key? key}) : super(key: key);

  @override
  State<BranchINR> createState() => _BranchINRState();
}

class _BranchINRState extends State<BranchINR> {
  bool? isLessThanOneFour;

  @override
  Widget build(BuildContext context) {
    if (isLessThanOneFour == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            title: "INR < 1.4",
            onPressed: () {},
          ),
          CustomButton(
            title: "INR ≥ 1.4",
            onPressed: () {},
          ),
        ],
      );
    } else {
      return const Text("Other path");
    }
  }
}
