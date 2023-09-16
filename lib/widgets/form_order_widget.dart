import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page_01/state_management/state_management.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../const/constant.dart';

class FormOrderWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final TextEditingController amountController;
  final TextEditingController notesController;

  const FormOrderWidget(
      {super.key,
      required this.nameController,
      required this.addressController,
      required this.phoneController,
      required this.amountController,
      required this.notesController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.sw,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                  hintText: 'Name'),
            ),
            TextFormField(
              controller: addressController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                  hintText: 'Address'),
            ),
            TextFormField(
              controller: phoneController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                  hintText: 'Phone Number'),
            ),
            Obx(() => ChipsChoice.multiple(
                  value: colorSelected.value,
                  onChanged: (color) => colorSelected.value = color,
                  choiceItems: C2Choice.listFrom(
                      source: Constant.colors,
                      value: (index, val) => val,
                      label: (index, val) => val),
                  choiceCheckmark: true,
                  choiceStyle: C2ChipStyle.outlined(color: Colors.black),
                )),
            Obx(() => ChipsChoice.multiple(
                  value: sizeSelected.value,
                  onChanged: (size) => sizeSelected.value = size,
                  choiceItems: C2Choice.listFrom(
                      source: Constant.sizes,
                      value: (index, val) => val,
                      label: (index, val) => val),
                  choiceCheckmark: true,
                  choiceStyle: C2ChipStyle.outlined(color: Colors.blue),
                )),
            Obx(
              () => ChipsChoice.single(
                  value: comboSelected.value,
                  onChanged: (size) => comboSelected.value = size,
                  choiceItems: C2Choice.listFrom(
                      source: Constant.combo,
                      value: (index, val) => val,
                      label: (index, val) => val),
                  choiceCheckmark: true,
                  choiceStyle: C2ChipStyle.filled()),
            ),
            TextFormField(
              controller: amountController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                  hintText: 'Amount'),
            ),
            TextFormField(
              controller: notesController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                  hintText: 'Notes'),
            ),
          ],
        ),
      ),
    );
  }
}
