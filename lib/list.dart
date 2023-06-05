import 'package:flutter/material.dart';

import 'namedata.dart';
import 'det.dart';

void main() {
  runApp(list(
    name: '',
    username: '',
  ));
}

// ignore: camel_case_types
class list extends StatelessWidget {
  String name;
  list({
    required this.name,
    required String username,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wellcome:$name'),
      ),
      body: const MyHomePage(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> studentname = [
    'sewareg',
    'woinshet',
    'titi',
    'shegaw',
    'fasil',
    'kebede',
    'diriba',
    'genet',
    'abebe',
    'tsige',
    'rahel'
  ];
  static List<String> desk = [
    '    email:sewareg@gmail.com\n    age:  21\n    address:AA\n    phoneNo: 0923456456\n    department:It third',
    '    email:woineshet@gmail.com\n    age: 21\n    address:AA\n    phoneNo: 0923456456\n    department:It third',
    '    email:titi@gmail.com\n    age:21\n    phoneNo: 0923456456\n    department:It third',
    '    email:shegaw@gmail.com\n    age:21\n    phoneNo: 0923456456\n    department:It third',
    '    email:fasil@gmail.com\n    age:21\n    phoneNo: 0923456456\n    department:It third',
    '    email:kebede@gmail.com\n    age:21\n    phoneNo: 0923456456\n    department:It third',
    '    email:diriba@gmail.com\n    age:21\n    phoneNo: 0923456456\n    department:It third',
    '    address:AA',
    '     email:genet@gmail.com\n  age:21\n    phoneNo: 0923456456\n    department:It third',
    '     email:abebe@gmail.com,\n  age:21\n    phoneNo: 0923456456\n    department:It third',
    '    email:tsige@gmail.com,\n  age:21,\n    phoneNo: 0923456456,\n    department:It third',
    '    email:rahel@gmail.com\n  age:21\n    phoneNo: 0923456456\n    department:It third',
  ];
  final List<studentDataModel> studentdata = List.generate(
      studentname.length,
      (index) => studentDataModel(
          studentname[index], desk[index], '${desk[index]} Description...'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(studentdata[index].name),
                  leading: const SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => studentDetail(
                              studDataModel: studentdata[index],
                            )));
                  },
                ),
              );
            }));
  }
}
