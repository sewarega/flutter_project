import 'package:flutter/material.dart';
import 'det.dart';

class studentDetail extends StatelessWidget {
  final studentDataModel studDataModel;
  const studentDetail({Key? key, required this.studDataModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(studDataModel.name),
      ),
      body: Column(
        children: [
          Text(
            studDataModel.desc,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
