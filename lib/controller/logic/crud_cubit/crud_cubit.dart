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
  create() async {
    await pref.add({
      "branch": data.length + 1,
      "customNo": ControllerData.customNoController.text,
      "arabicName": ControllerData.arabicNameController.text,
      "arabicDescription": ControllerData.arabicDescriptionController.text,
      "englishName": ControllerData.englishNameController.text,
      "englishDescription": ControllerData.englishDescriptionController.text,
      "note": ControllerData.noteController.text,
      "address": ControllerData.addressController.text,
    }).then((value) {
      Get.snackbar("Success", "Add Data");
      // emit(CreateState());
    });
  }

//Read
  read() async {
    emit(LoadingState());

    pref.orderBy("branch", descending: false).snapshots().listen((event) {
      data.clear();
      data.addAll(event.docs);
      firstHandleData(data: data);
      length = data.length;
      emit(ReadState());
    });
  }

//Update
  update({
    required id,
  }) async {
    await pref.doc(id).update({
      "branch": ControllerData.branchController.text,
      "customNo": ControllerData.customNoController.text,
      "arabicName": ControllerData.arabicNameController.text,
      "arabicDescription": ControllerData.arabicDescriptionController.text,
      "englishName": ControllerData.englishNameController.text,
      "englishDescription": ControllerData.englishDescriptionController.text,
      "note": ControllerData.noteController.text,
      "address": ControllerData.addressController.text,
    }).then((value) {
      Get.snackbar("Success", "Data Updated");
      emit(UpdateState());
    });
  }

//Delete
  delete({required id}) async {
    await pref.doc(id).delete().then((value) {
      Get.snackbar("Success", "Data Deleted");
      // emit(DeleteState());
    });
  }
}
