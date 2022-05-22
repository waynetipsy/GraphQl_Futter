import 'package:flutter/material.dart';
import './add_todo.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
      body: CustomScrollView(
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
                        
                      Expanded(
                          child: ListView(
                        children: List.generate(5, (index) {
                          return ListTile(
                            
                            title: const Text('Todo title'),
                            subtitle: const Text('Todo time'),
                            leading: const CircleAvatar(
                              backgroundColor:  Colors.grey,
                            ),
                            trailing:  IconButton(
                              onPressed: () {},
                              
                                  icon: const Icon(Icons.delete)),
                            );
            
                        }),
                      )),
                    ],
                  ),
                ),
              )
            ],
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