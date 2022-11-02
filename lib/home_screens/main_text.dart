import 'package:flutter/material.dart';

class WidgetsClass {
  static sizedNull (){
    return const SliverToBoxAdapter(
      child: SizedBox.shrink(),
    );
  }
  static sizedBox (){
    return const SliverToBoxAdapter(
      child: SizedBox(height: 100),
    );
  }
  static Widget mainText() {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 30,
            bottom: 5,
          ),
          child: Text(
            "TAOM QO'SHISH",
            style: TextStyle(
              color: Colors.indigo.shade900,
              fontWeight: FontWeight.w800,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }

  static Widget infoText(String text) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 20,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.indigo.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }


  static Widget divider(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          bottom: 25,
        ),
        child: Container(
          height: 10,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.indigo),
        ),
      ),
    );
  }

  static Widget textField(String label, TextEditingController controller) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 15,
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
          ),
        ),
      ),
    );
  }
}
