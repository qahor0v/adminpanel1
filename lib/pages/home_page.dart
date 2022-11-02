import 'package:adminpanel1/data/items_db.dart';
import 'package:adminpanel1/home_screens/main_text.dart';
import 'package:adminpanel1/models/food_model.dart';
import 'package:adminpanel1/pages/sidebar.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  static const String id = "home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSuyuq = false;
  bool isXamirli = false;
  bool isParhezli = false;
  bool isPishiriq = false;
  bool isFasfood = false;
  bool isMilliy = false;
  bool isWorld = false;
  int itemIndex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController otherName = TextEditingController();
  TextEditingController videoUrls = TextEditingController();
  TextEditingController steps = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController foodSize = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController imgUrl = TextEditingController();
  TextEditingController otherItem = TextEditingController();
  List<Map<String, String>> itemDB = [];
  List<Map<String, String>> itemsWithSize = [];
  List<String> namesList = [];
  List<String> videoUrlList = [];
  List<String> stepsList = [];
  List<String> imageUrlsList = [];
  List<String> sources = [];
  List<String> otherItems = [];

  CollectionReference foodCollection =
      Firestore.instance.collection('allfoods');

  void addFood() async {
    var food = FoodModel(
      uid: DateTime.now().toString(),
      name: name.text.trim(),
      id: id.text.trim(),
      isSuyuq: isSuyuq,
      isXamirli: isXamirli,
      isParhezli: isParhezli,
      isPishiriq: isPishiriq,
      isFasfood: isFasfood,
      isMilliy: isMilliy,
      isWorld: isWorld,
      description: desc.text.trim(),
      names: namesList,
      video_urls: videoUrlList,
      img_urls: imageUrlsList,
      steps: stepsList,
      other_items: otherItems,
      items: itemsWithSize,
      size: foodSize.text.trim(),
      time: time.text.trim(),
      sources: sources,
    ).toJson();
    setState(() {
      res = "$food";
    });
    await foodCollection.add({"food": food});
  }

  String res = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade500,
        title: const Text("Admin Panel"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              icon:const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const Sidebar(),
      body: CustomScrollView(
        slivers: [
          WidgetsClass.mainText(),
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taom nomi va ID-sini kiritish"),
          WidgetsClass.textField("Taom Nomi", name),
          WidgetsClass.textField("Taom ID-si", id),
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taom kategoriyasi"),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Suyuq"),
              value: isSuyuq,
              onChanged: (bool value) {
                setState(() {
                  isSuyuq = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Xamirli"),
              value: isXamirli,
              onChanged: (bool value) {
                setState(() {
                  isXamirli = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Parhezli"),
              value: isParhezli,
              onChanged: (bool value) {
                setState(() {
                  isParhezli = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Pishiriq"),
              value: isPishiriq,
              onChanged: (bool value) {
                setState(() {
                  isPishiriq = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Pasfood"),
              value: isFasfood,
              onChanged: (bool value) {
                setState(() {
                  isFasfood = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Milliy Taom"),
              value: isMilliy,
              onChanged: (bool value) {
                setState(() {
                  isMilliy = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: Text("Jahon Oshxonasidan"),
              value: isWorld,
              onChanged: (bool value) {
                setState(() {
                  isWorld = value;
                });
              },
            ),
          ),
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taom haqida ma'lumot"),
          WidgetsClass.textField("Malumot kiriting ", desc),
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taomning boshqa nomlarini kiritish"),
          textBuilder(namesList),
          textFieldButton("Taomning Boshqa nomlari", otherName, namesList),
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taomning video havolalarini kiritish"),
          textBuilder(videoUrlList),
          textFieldButton("Video Havolasini kiriting", videoUrls, videoUrlList),

          ///
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taomning foto havolalarini kiritish"),
          textBuilder(imageUrlsList),
          textFieldButton("Foto Havolasini kiriting", imgUrl, imageUrlsList),

          ///
          ///
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taomni tayyorlash qadamlarini qo'shish"),
          textBuilder(stepsList),
          textFieldButton("Qadamni kiriting", steps, stepsList),
          WidgetsClass.divider(context),
          itemDB.isEmpty
              ? WidgetsClass.sizedNull()
              : WidgetsClass.infoText("Tanlangan Masalliqlar"),
          sliverGridView(),
          WidgetsClass.infoText("Masalliqlarni Tanlang"),
          sliverGrid(),
          ///
          ///
          ///
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Taomning boshqa masalliqlarini kiritish"),
          textBuilder(otherItems),
          textFieldButton("Masalliq nomini kiriting", otherItem, otherItems),
          ///
          ///
          ///
          WidgetsClass.divider(context),
          WidgetsClass.infoText(
              "Miqdorli Tayyorlash (kg, portsiya, dona, ...)"),
          WidgetsClass.textField("Miqdorni kiriting", foodSize),
          WidgetsClass.divider(context),
          WidgetsClass.infoText("Miqdorli Tayyorlash uchun ketadigan vaqt"),
          WidgetsClass.textField("Qancha vaqt ketadi?", time),
          WidgetsClass.divider(context),
          itemDB.isEmpty
              ? WidgetsClass.sizedNull()
              : WidgetsClass.infoText("Masalliqlar Miqdorini kiritish"),
          itemsWithSize.isEmpty ? WidgetsClass.sizedNull() : textBuilderSizer(),
          itemDB.isEmpty ? WidgetsClass.sizedNull() : textFieldSizer(),
          WidgetsClass.infoText("Olingan Ma'lumotlar Manbalarini Kiritish"),
          textBuilder(sources),
          textFieldButton("Sayt manzili yoki manba nomi", source, sources),
          addFoodToFireStore(),
          SliverToBoxAdapter(
            child: Text(res),
          ),
          WidgetsClass.sizedBox(),
        ],
      ),
    );
  }

  Widget addFoodToFireStore() {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 80,
            bottom: 10,
          ),
          child: ElevatedButton(
            onPressed: () {
              addFood();
            },
            child: const Text("Taomni Qo'shish"),
          ),
        ),
      ),
    );
  }

  textFieldButton(
      String label, TextEditingController controller, List<String> list) {
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
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.indigo,
              ),
              onPressed: () {
                setState(() {
                  list.add(controller.text);
                  controller.text = "";
                });
              },
            ),
            labelText: label,
          ),
        ),
      ),
    );
  }

  textFieldSizer() {
    TextEditingController controller = TextEditingController();
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
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.indigo,
              ),
              onPressed: () {
                setState(() {
                  itemsWithSize.add({
                    "name": itemDB[itemIndex]['name']!,
                    "id": itemDB[itemIndex]['id']!,
                    "url": itemDB[itemIndex]['url']!,
                    "size": controller.text.trim(),
                  });
                  if (controller.text.isNotEmpty &&
                      itemDB.length - 1 != itemIndex) {
                    itemIndex++;
                  }
                  controller.text = "";
                });
              },
            ),
            labelText: itemDB[itemIndex]['name'],
          ),
        ),
      ),
    );
  }

  textBuilder(List list) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text("${index + 1}. ${list[index]}"),
          );
        },
        childCount: list.length,
      ),
    );
  }

  textBuilderSizer() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              "${itemsWithSize[index]['size']!} ${itemsWithSize[index]['name']!}",
            ),
          );
        },
        childCount: itemsWithSize.length,
      ),
    );
  }

  sliverGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: 5.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                itemDB.add(ItemsDataSet.items[index]);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Text(
                ItemsDataSet.items[index]['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        childCount: ItemsDataSet.items.length,
      ),
    );
  }

  sliverGridView() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: 5.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                itemDB.remove(itemDB[index]);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Text(
                itemDB[index]['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        childCount: itemDB.length,
      ),
    );
  }
}
