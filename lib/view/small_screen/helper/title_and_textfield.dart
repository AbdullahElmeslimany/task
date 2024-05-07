import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../model/textfromfieldcustom.dart';

titleAndTextFieldSmall(context,
    {required TextEditingController controller,
    required title,
    ltr = true,
    enabel = true,
    double height = 40,
    maxLines = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey[800]),
      ),
      const Gap(6),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: textFromFieldcustom(
            ltr: ltr,
            enabel: enabel,
            maxLines: maxLines,
            controller: controller,
            width: MediaQuery.sizeOf(context).width),
      )
    ],
  );
}
