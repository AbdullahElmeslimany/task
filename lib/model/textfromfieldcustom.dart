import 'package:flutter/material.dart';

textFromFieldcustom({
  bool backgroundAnable = false,
  bool ltr = false,
  bool enabel = true,
  bool pass = false,
  maxLines = 1,
  TextInputType keyboardType = TextInputType.name,
  length = false,
  double width = 120,
  int lengthTall = 350,
  required TextEditingController controller,
  // required String text,
  String textHide = "",
  double hightV = 7,
  double hight = 37,
  double padding = 10,
  Color color = const Color.fromARGB(99, 192, 192, 192),
}) {
  return SizedBox(
    // height: hight,
    width: width,
    child: TextFormField(
      enabled: enabel,
      obscureText: pass,
      textDirection: ltr == true ? TextDirection.ltr : TextDirection.rtl,
      maxLines: maxLines,
      maxLength: length == true ? lengthTall : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '* The field cannot be empty....';
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(fontSize: 15),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: padding, vertical: hightV),
          filled: backgroundAnable,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: color,
          )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color,
            ),
          ),
          // labelText: text,
          hintText: textHide,
          labelStyle: const TextStyle(fontSize: 13),
          // hintText: text,
          hintStyle: const TextStyle(fontSize: 13)),
      // textAlign: rtl == true ? TextAlign.start : TextAlign.end,
    ),
  );
}
