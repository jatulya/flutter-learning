import 'package:flutter/material.dart';
import 'package:todo_list/components/footer.dart';
import 'package:todo_list/components/header.dart';
import 'package:todo_list/components/subheading.dart';
import 'package:todo_list/components/task_row.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static const _listItems = [CustomHeader(), Subheading(), TaskRow()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create-task'),
        backgroundColor: Colors.blue,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        // <-- Forces perfect circular shape
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Footer (bottom nav bar)
      bottomNavigationBar: const Footer(),

      // Main content
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView.separated(
          itemBuilder: (context, index) => Center(child: _listItems[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemCount: _listItems.length,
        ),
      ),
    );
  }
}
