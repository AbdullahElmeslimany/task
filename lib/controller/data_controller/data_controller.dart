import 'package:flutter/material.dart';

abstract class ControllerData {
  static TextEditingController branchController =
      TextEditingController(text: 0.toString());
  static TextEditingController customNoController =
      TextEditingController(text: 0.toString());
  static TextEditingController arabicNameController = TextEditingController();
  static TextEditingController arabicDescriptionController =
      TextEditingController();
  static TextEditingController englishNameController = TextEditingController();
  static TextEditingController englishDescriptionController =
      TextEditingController();
  static TextEditingController noteController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
