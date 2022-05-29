import 'package:flutter/material.dart';
import 'package:graphql_provider/Providers/get_task_provider.dart';
import 'package:provider/provider.dart';
import './add_todo.dart';
import '../Providers/add_task_provider.dart';
import '../Providers/get_task_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFetched = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Home',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Consumer<GetTaskProvider>(
        builder: (context, task, child) {
          if (isFetched == false) {
            task.getTask(true);

            Future.delayed( const Duration(seconds: 3), () => isFetched = true);
          }
          return RefreshIndicator(
            onRefresh: () {
              task.getTask(false);
              return Future.delayed( const Duration(seconds: 3));
            },
            child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: const Text("Available todo"),
                            ),
                          if(task.getResponseData().isEmpty) const Text('No Todo found'),
                              
                            Expanded(
                                child: ListView(
                              children: List.generate(task.getResponseData().length,
                              (index) {
                                final data = task.getResponseData()[index];
                                return ListTile(
                              contentPadding: const EdgeInsets.all(0), 
                                  title:  Text(data['task']),
                                  subtitle:  Text(data['timeAdded'].toString()),
                                  leading:  CircleAvatar(
                                    backgroundColor:  Colors.grey,
                                    child: Text(data['id'].toString()),
                                  ),
                                  trailing:  IconButton(
                                    onPressed: () {},
                                    
                                        icon: const Icon(Icons.delete)),
                                  );
                               }
                              ),
                            )
                           ), 
                         const  SizedBox(height: 150)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTodo()));
          },
          label: const Text('Add Todo',
           style: TextStyle(
             color: Colors.black,
           )
          ),
        ),
    );
  }
}