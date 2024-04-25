import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../constant/app_dimens.dart';
import '../../constant/app_font.dart';
import '../../customs/custom_btn.dart';
import '../../customs/custom_text.dart';
import '../../database_helper/database_helper.dart';
import '../add_screen/custome_field.dart';

class EditScreen extends StatefulWidget {
  int editId;
  EditScreen({super.key, required this.editId});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> with RouteAware{

  final TextEditingController _nameEdit = TextEditingController();
  final TextEditingController _ageEdit = TextEditingController();
  final TextEditingController _SalaryEdit = TextEditingController();
  final TextEditingController _phoneNumberEdit = TextEditingController();
  final TextEditingController _addressEdit = TextEditingController();

  editData(String name, String age, String salary, String phoneNumber, String address) async{
    var open = DatabaseHelper();
    await open.createDatabase();
    open.edit(widget.editId, _nameEdit.text, _ageEdit.text, _SalaryEdit.text, _phoneNumberEdit.text, _addressEdit.text);
  }

  @override
  void initState() {
    print(widget.editId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.green,
        title: CustomText(
          name: "Edit Employee",
          color: AppColor.white,
          fontWeight: AppFont.bold,
          fontSize: AppDimens.size_30,
        ),
        iconTheme: IconThemeData(
          color: AppColor.white
        ),
        centerTitle: true,
      ),
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeAddField(
                  context,
                  0.065,
                  0.8,
                  _nameEdit,
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
                      _ageEdit,
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
                      _SalaryEdit,
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
                  _phoneNumberEdit,
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
                  _addressEdit,
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
              SizedBox(
                height: AppDimens.size_30,
              ),
              InkWell(
                onTap: (){
                  // insertData(_nameEdit.text, _ageEdit.text, _SalaryEdit.text, _phoneNumberEdit.text, _addressEdit.text);
                  editData(_nameEdit.text, _ageEdit.text, _SalaryEdit.text, _phoneNumberEdit.text, _addressEdit.text);
                },
                child: CustomBtn(context, 0.065, 0.7, AppColor.green, AppDimens.size_20,
                    "Edit", AppColor.yellow, AppFont.bold, 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
