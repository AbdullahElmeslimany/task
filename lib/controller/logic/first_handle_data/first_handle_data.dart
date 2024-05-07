import '../../data_controller/data_controller.dart';

firstHandleData({data}) {
  ControllerData.branchController.text = data[0]["branch"].toString();
  ControllerData.customNoController.text = data[0]["customNo"];
  ControllerData.arabicNameController.text = data[0]["arabicName"];
  ControllerData.arabicDescriptionController.text =
      data[0]["arabicDescription"];
  ControllerData.englishNameController.text = data[0]["englishName"];
  ControllerData.englishDescriptionController.text =
      data[0]["englishDescription"];
  ControllerData.noteController.text = data[0]["note"];
  ControllerData.addressController.text = data[0]["address"];
}
