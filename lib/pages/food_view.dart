import 'package:flutter/material.dart';

class FoodView extends StatelessWidget {
  const FoodView({required this.json, Key? key}) : super(key: key);
  final json;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text(foodModel().name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Nomi" + json['name']),
            Text("ID:" + json['id']),
            Text("Taom Haqida: " + json['description']),
            Text("Xamirli" + json['isXamirli'].toString()),
            Text("Video linklari"+json['video_urls'].toString()),
            Text("foto linklari " + json['img_urls'].toString()),
            Text("Tayyorlash qadamlari"+ json['steps'].toString()),
            Text("Boshqa nomlari" + json['names'].toString()),
          ],
        ),
      )
    );
  }
}
