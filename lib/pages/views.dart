import 'package:adminpanel1/pages/food_view.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  CollectionReference foodsCollection =
      Firestore.instance.collection('allfoods');
  List<Document> foodsList = [];

  void getData() async {
    final list = await foodsCollection.orderBy("food").get();
    setState(() {
      foodsList.addAll(list);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods Data"),
      ),
      body: foodsList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: foodsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.soup_kitchen),
                  subtitle: Text(
                    foodsList[index].map['food']['id'],
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                    ),
                  ),
                  title: Text(
                    foodsList[index].map['food']['name'],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FoodView(
                          json: foodsList[index].map['food'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
