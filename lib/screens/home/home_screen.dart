import 'package:flutter/material.dart';
import 'package:prisomtechnology/constant/app_color.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import 'package:prisomtechnology/constant/app_font.dart';
import 'package:prisomtechnology/customs/custom_text.dart';

import '../../database_helper/database_helper.dart';
import '../../main.dart';
import '../edit_screen/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  List<Map<dynamic, dynamic>> finalMainData = [];
  bool deleteBtn = false;
  late int userId;

  Future<void> initDatabase() async {
    var open = DatabaseHelper();
    await open.createDatabase();
    var result = await open.read();
    setState(() {
      finalMainData = result;
    });
  }

  deleteData(int id) async {
    var open = DatabaseHelper();
    await open.createDatabase();
    await open.delete(id);
    setState(() {
      initDatabase();
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObserverUtils.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    print("did pop");
    initDatabase();
  }

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.green,
        title: CustomText(
          name: "Employee",
          color: AppColor.white,
          fontWeight: AppFont.bold,
          fontSize: AppDimens.size_30,
        ),
        centerTitle: true,
        actions: [
          deleteBtn == true
              ? InkWell(
                  onTap: () {
                    deleteData(userId);
                    deleteBtn = false;
                  },
                  child: Icon(
                    Icons.delete,
                    color: AppColor.yellow,
                    size: AppDimens.size_30,
                  ),
                )
              : Container(),
          const SizedBox(
            width: AppDimens.size_20,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: finalMainData.length,
          itemBuilder: (context, index) {
            final employee = finalMainData[index];
            return InkWell(
              onLongPress: () {
                deleteBtn = true;
                userId = employee["_id"];
                setState(() {});
              },
              onTap: () {
                deleteBtn = false;
                setState(() {});
              },
              onDoubleTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreen(editId: employee["_id"],)));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        name: "id: ${employee["_id"] ?? ""}",
                        color: AppColor.black,
                        fontWeight: AppFont.bold,
                        fontSize: AppDimens.size_20),
                    CustomText(
                        name: "name: ${employee["name"] ?? ""}",
                        color: AppColor.black,
                        fontSize: AppDimens.size_20),
                    CustomText(
                        name: "age: ${employee["age"] ?? ""}",
                        color: AppColor.black,
                        fontSize: AppDimens.size_20),
                    CustomText(
                        name: "salary: ${employee["salary"] ?? ""}",
                        color: AppColor.black,
                        fontSize: AppDimens.size_20),
                    CustomText(
                        name: "phoneNumber: ${employee["phoneNumber"] ?? ""}",
                        color: AppColor.black,
                        fontSize: AppDimens.size_20),
                    CustomText(
                        name: "address: ${employee["address"] ?? ""}",
                        color: AppColor.black,
                        fontSize: AppDimens.size_20),
                    Divider(
                      height: AppDimens.size_50,
                      thickness: AppDimens.size_2,
                      color: AppColor.black,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
