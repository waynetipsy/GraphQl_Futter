import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_provider/Providers/add_task_provider.dart';
import 'package:provider/provider.dart';
import './Screens/home_page.dart';
import './Providers/add_task_provider.dart';

void main() async {
await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ ChangeNotifierProvider(create: (_) => AddTaskProvider()),
      ],
     child:  const MaterialApp(
     debugShowCheckedModeBanner: false,
        home: HomePage(),
     )
    );
  }
}