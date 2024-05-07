import 'package:flutter/material.dart';

import '../../../model/textfromfieldcustom.dart';

SizedBox titleAndTextFieldBig(BuildContext context,
    {required TextEditingController controller,
    required title,
    ltr = true,
    enabel = true,
    double height = 40,
    maxLines = 1}) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width / 2.17,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.grey[800]),
        ),
        // const Gap(20),
        textFromFieldcustom(
            width: MediaQuery.sizeOf(context).width / 3.6,
            backgroundAnable: true,
            maxLines: maxLines,
            enabel: enabel,
            ltr: ltr,
            controller: controller)
      ],
    ),
  );
}
