import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../data_controller/data_controller.dart';
part 'handle_page_state.dart';

class HandlePageCubit extends Cubit<HandlePageState> {
  HandlePageCubit() : super(HandlePageInitial());
  late PageController pageController;
  int index = 0;
  late int length;
  init() {
    pageController = PageController(initialPage: index);
    emit(HandlePageInitial());
  }

  changePage({pageindex}) {
    index = pageindex;
    emit(ChangePageState(index: index));
  }

  firstlength({required cubitCRUD}) {
    length = cubitCRUD.length;
    emit(FirstLengthState());
  }

  changelength() {
    length = length + 1;
    emit(ChangeLengthState());
  }

  handleData({required cubitCRUD, required value}) {
    if (value <= cubitCRUD.data.length - 1) {
      ControllerData.branchController.text =
          cubitCRUD.data[value]["branch"].toString();
      ControllerData.customNoController.text =
          cubitCRUD.data[value]["customNo"];
      ControllerData.arabicNameController.text =
          cubitCRUD.data[value]["arabicName"];
      ControllerData.arabicDescriptionController.text =
          cubitCRUD.data[value]["arabicDescription"];
      ControllerData.englishNameController.text =
          cubitCRUD.data[value]["englishName"];
      ControllerData.englishDescriptionController.text =
          cubitCRUD.data[value]["englishDescription"];
      ControllerData.noteController.text = cubitCRUD.data[value]["note"];
      ControllerData.addressController.text = cubitCRUD.data[value]["address"];
    } else {
      ControllerData.branchController.text =
          (cubitCRUD.data.length + 1).toString();
      ControllerData.customNoController.clear();
      ControllerData.arabicNameController.clear();
      ControllerData.arabicDescriptionController.clear();
      ControllerData.englishNameController.clear();
      ControllerData.englishDescriptionController.clear();
      ControllerData.noteController.clear();
      ControllerData.addressController.clear();
    }
  }
}
