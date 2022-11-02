import 'package:adminpanel1/pages/home_page.dart';
import 'package:adminpanel1/pages/views.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.indigoAccent,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.list_alt,
              color: Colors.white,
            ),
            title: const Text(
              "Get Foods",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ViewPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            title: const Text(
              "Add Food",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
          )
        ],
      ),
    );
  }
}
