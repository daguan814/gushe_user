import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gsform/gs_form/core/form_style.dart';
import 'package:gsform/gs_form/model/data_model/date_data_model.dart';
import 'package:gsform/gs_form/model/data_model/radio_data_model.dart';
import 'package:gsform/gs_form/widget/field.dart';
import 'package:gsform/gs_form/widget/form.dart';

import '../../common/mywidget/MyButton.dart';
import '../../controller/login/infoCompleteController.dart';

// ignore: camel_case_types
class infoCompletePage extends GetView<infoCompleteController> {
  const infoCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(infoCompleteController()); //导入controller
    return Scaffold(
        appBar: AppBar(title: const Text('信息完善')), body: _buildView(context));
  }

  //主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: _buildForm(context),
      ),
    );
  }

//表单组件,这里用的是包
  Widget _buildForm(BuildContext context) {
    late GSForm form;

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: form = GSForm.singleSection(context,
          style: GSFormStyle(
              backgroundFieldColor: const Color.fromARGB(255, 196, 212, 225),
              backgroundSectionColor: const Color.fromARGB(31, 221, 212, 50),
              sectionRadius: 20, //最外层圆角
              sectionCardPadding: 20, //各个输入框之间的间距
              requiredText: '必填', //required : 必填项
              sectionCardElevation: 30,
              fieldTextStyle: const TextStyle(fontSize: 15)),
          fields: [
            //?昵称
            GSField.text(
              tag: 'nickName',
              title: '昵称',
              value: "123",
              hint: "最多15个字符",
              weight: 12,
              maxLine: 1,
              required: true,
              maxLength: 15, //最大长度
              // validateRegEx:RegExp("[A-Za-z0-9_\-\u4e00-\u9fa5]+"), //正则表达式
              errorMessage: "请填写一个昵称",
            ),
            //?性别
            GSField.radioGroup(
              hint: '????',
              tag: 'sex',
              value: "123",
              showScrollBar: false,
              scrollBarColor: Colors.red,
              height: 65,
              scrollable: false,
              required: true,
              weight: 12,
              title: '性别',
              searchable: false, //搜索框
              // searchHint: 'Search...',
              // searchIcon: const Icon(Icons.search),
              // searchBoxDecoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.blue,
              //     width: 1,
              //   ),
              //   borderRadius: BorderRadius.circular(8),
              // ),
              items: [
                RadioDataModel(title: '男', isSelected: true, data: "男"),
                RadioDataModel(title: '女', isSelected: false, data: "女"),
              ],
              callBack: (data) {
                //按钮点击发生改变时回调
              },
            ),
            //? 手机号
            GSField.mobile(
              tag: "phone",
              hint: "请输入手机号",
              maxLength: 11,
              weight: 12,
              required: true,
              errorMessage: "该手机号有误",
              validateRegEx: RegExp(
                  r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$'),
            ),
            //? 头像
            GSField.imagePicker(
              tag: "headImg",
              iconWidget: const Icon(Icons.add_a_photo_outlined),
              title: "头像",
              required: true,
              cameraPopupTitle: "拍照",
              galleryPopupTitle: "相册",
            ),
            GSField.text(
              tag: "trueName",
              required: true,
              hint: "请输入您的真实姓名",
              title: "姓名",
            ),
            GSField.text(
              required: true,
              tag: "age",
              hint: "请输入您的年龄",
              title: "年龄",
            ),

            //?确认按钮，运用自建widget
            MyButtonWidget(
              height: 40,
              width: 50,
              text: "",
              radius: 12,
              icon: const Icon(Icons.done),
              onPressed: () {
                bool isValid = form.isValid(); //表单检验打开
                if (isValid) {
                  //验证通过才操作表单数据
                  controller.map = form.onSubmit(); //表单数据存储

                  print(controller.map.toString());
                  // print(controller.map["sex"].data);    //!获取具体数据
                  controller.infoComplete();       //!信息完善
                }

                // debugPrint(isValid.toString());//
              },
            )
          ]),
    ));
  }
}
