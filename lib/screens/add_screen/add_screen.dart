import 'package:flutter/material.dart';
import 'package:prisomtechnology/constant/app_color.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import 'package:prisomtechnology/constant/app_font.dart';
import 'package:prisomtechnology/customs/custom_btn.dart';
import 'package:prisomtechnology/screens/add_screen/custome_field.dart';

import '../../customs/custom_text.dart';
import '../../database_helper/database_helper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _Salary = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();

  insertData(String name, String age, String salary, String phoneNumber, String address) async{
    var insertDatabase = DatabaseHelper();
    await insertDatabase.createDatabase();
    await insertDatabase.insert(name, age, salary, phoneNumber, address);
  }

  readData() async{
    var database = DatabaseHelper();
    await database.createDatabase();
    var a = await database.read();
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.green,
        title: CustomText(
          name: "Add Employee",
          color: AppColor.white,
          fontWeight: AppFont.bold,
          fontSize: AppDimens.size_30,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeAddField(
                    context,
                    0.065,
                    0.8,
                    _name,
                    "Enter Your Name",
                    AppColor.black,
                    AppFont.regular,
                    AppDimens.size_18,
                    20,
                    20,
                    20,
                    20,
                  TextInputType.name
                ),
                SizedBox(
                  height: AppDimens.size_30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomeAddField(
                        context,
                        0.065,
                        0.3,
                        _age,
                        "Age",
                        AppColor.black,
                        AppFont.regular,
                        AppDimens.size_18,
                        20,
                        20,
                        20,
                        20,
                        TextInputType.number
                    ),
                    CustomeAddField(
                        context,
                        0.065,
                        0.3,
                        _Salary,
                        "Salary",
                        AppColor.black,
                        AppFont.regular,
                        AppDimens.size_18,
                        20,
                        20,
                        20,
                        20,
                        TextInputType.number
                    )
                  ],
                ),
                SizedBox(
                  height: AppDimens.size_30,
                ),
                CustomeAddField(
                    context,
                    0.065,
                    0.8,
                    _phoneNumber,
                    "Enter Phone Number",
                    AppColor.black,
                    AppFont.regular,
                    AppDimens.size_18,
                    20,
                    20,
                    20,
                    20,
                    TextInputType.number
                ),
                SizedBox(
                  height: AppDimens.size_30,
                ),
                CustomeAddField(
                    context,
                    0.15,
                    0.8,
                    _address,
                    "Enter Your Address",
                    AppColor.black,
                    AppFont.regular,
                    AppDimens.size_18,
                    20,
                    20,
                    20,
                    20,
                    TextInputType.text
                ),
                const SizedBox(
                  height: AppDimens.size_30,
                ),
                InkWell(
                  onTap: (){
                    insertData(_name.text, _age.text, _Salary.text, _phoneNumber.text, _address.text);
                    readData();
                  },
                  child: CustomBtn(context, 0.065, 0.7, AppColor.green, AppDimens.size_20,
                      "Submit", AppColor.yellow, AppFont.bold, 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
