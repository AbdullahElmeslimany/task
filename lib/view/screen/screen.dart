import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../controller/data_controller/data_controller.dart';
import 'helper/title_and_textfield_v.dart';
import 'helper/title_and_textfield.dart';

newScreen(BuildContext context) {
  return SingleChildScrollView(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  titleAndTextFieldBig(context,
                      controller: ControllerData.branchController,
                      title: "Branch",
                      enabel: false),
                  const Gap(25),
                  titleAndTextFieldBig(context,
                      ltr: false,
                      controller: ControllerData.arabicNameController,
                      title: "Arabic Name"),
                  const Gap(25),
                  titleAndTextFieldBig(context,
                      controller: ControllerData.englishNameController,
                      title: "English Name"),
                  const Gap(25),
                  titleAndTextFieldBig(
                    context,
                    controller: ControllerData.noteController,
                    title: "Note",
                    maxLines: 4,
                  ),
                  const Gap(25),
                ],
              )
            ],
          ),
        ),
        const Gap(8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  titleAndTextFieldBig(context,
                      controller: ControllerData.customNoController,
                      title: "Custom No."),
                  const Gap(25),
                  titleAndTextFieldBig(context,
                      controller: ControllerData.arabicDescriptionController,
                      ltr: false,
                      title: "Arabic Description"),
                  const Gap(25),
                  titleAndTextFieldBig(context,
                      controller: ControllerData.englishDescriptionController,
                      title: "English Description"),
                  const Gap(25),
                  titleAndTextFieldBig(context,
                      controller: ControllerData.addressController,
                      title: "Address"),
                  const Gap(25),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

smoothU(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 15,
              child: titleAndTextFieldSmall(context,
                  controller: ControllerData.branchController,
                  title: "Branch",
                  enabel: false),
            ),
            const Gap(18),
            Expanded(
              flex: 8,
              child: titleAndTextFieldSmall(context,
                  controller: ControllerData.customNoController,
                  keyboardType: TextInputType.number,
                  title: "Custom No."),
            ),
          ],
        ),
        const Gap(15),
        titleAndTextFieldSmall(context,
            ltr: false,
            controller: ControllerData.arabicNameController,
            title: "Arabic Name"),
        const Gap(15),
        titleAndTextFieldSmall(context,
            controller: ControllerData.arabicDescriptionController,
            ltr: false,
            title: "Arabic Description"),
        const Gap(15),
        titleAndTextFieldSmall(context,
            controller: ControllerData.englishNameController,
            title: "English Name"),
        const Gap(15),
        titleAndTextFieldSmall(context,
            controller: ControllerData.englishDescriptionController,
            title: "English Description"),
        const Gap(15),
        titleAndTextFieldSmall(context,
            controller: ControllerData.noteController,
            title: "Note",
            maxLines: 4,
            height: 100),
        const Gap(15),
        titleAndTextFieldSmall(context,
            controller: ControllerData.addressController, title: "Address"),
      ],
    ),
  );
}
