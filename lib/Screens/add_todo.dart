import 'package:flutter/material.dart';


class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo',
        style: TextStyle(
          color: Colors.black
        ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('Add your first todo'),
                  ),

                  ///Add todo task input field
                  TextFormField(
                    controller: _task,
                    decoration: const InputDecoration(
                      labelText: 'Todo Task',
                    ),
                  ),

                   GestureDetector(
                      onTap:  () {},
                             
                          
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text( 'Save Task')),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}