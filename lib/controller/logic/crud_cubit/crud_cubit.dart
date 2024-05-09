import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:task/controller/logic/first_handle_data/first_handle_data.dart';
import '../../data_controller/data_controller.dart';
part 'crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  CrudCubit() : super(CrudInitial());
  CollectionReference pref = FirebaseFirestore.instance.collection("task");
  List data = [];
  late int length = data.length;

//Create
  create(cubit) async {
    await pref.add({
      "branch": data.length + 1,
//
      "customNo": "",
      "arabicName": "",
      "arabicDescription": "",
      "englishName": "",
      "englishDescription": "",
      "note": "",
      "address": "",
//
      // "customNo": ControllerData.customNoController.text,
      // "arabicName": ControllerData.arabicNameController.text,
      // "arabicDescription": ControllerData.arabicDescriptionController.text,
      // "englishName": ControllerData.englishNameController.text,
      // "englishDescription": ControllerData.englishDescriptionController.text,
      // "note": ControllerData.noteController.text,
      // "address": ControllerData.addressController.text,
    }).then((value) {
      cubit.changelength();
      cubit.pageController.jumpToPage(cubit.length - 1);
      Get.snackbar("Success", "Add Data");
      // emit(CreateState());
    }).onError((error, stackTrace) {
      Get.snackbar("Error", "Error Data");
    });
  }

//Read
  read(cubit) async {
    emit(LoadingState());

    pref.orderBy("branch", descending: false).snapshots().listen((event) {
      data.clear();
      data.addAll(event.docs);
      firstHandleData(data: data);
      length = data.length;
      cubit.pageController.jumpToPage(0);

      emit(ReadState());
    });
  }

//Update
  update(
    cubit, {
    required id,
  }) async {
    await pref.doc(id).update({
      "branch": int.parse(ControllerData.branchController.text),
      "customNo": ControllerData.customNoController.text,
      "arabicName": ControllerData.arabicNameController.text,
      "arabicDescription": ControllerData.arabicDescriptionController.text,
      "englishName": ControllerData.englishNameController.text,
      "englishDescription": ControllerData.englishDescriptionController.text,
      "note": ControllerData.noteController.text,
      "address": ControllerData.addressController.text,
    }).then((value) {
      // cubit.pageController.jumpToPage(length - 1);

      Get.snackbar("Success", "Data Updated");
      emit(UpdateState());
    });
  }

//Delete
  delete(cubit, {required id}) async {
    if (length > 1) {
      await pref.doc(id).delete().then((value) {
        Get.snackbar("Success", "Data Deleted");
        cubit.pageController.jumpToPage(length - 1);
        // emit(DeleteState());
      });
    }
  }
}
