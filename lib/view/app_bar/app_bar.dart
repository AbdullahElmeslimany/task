import 'package:flutter/material.dart';

import '../../controller/data_controller/data_controller.dart';

appBar(cubitCrud, cubit) {
  return AppBar(
    backgroundColor: Colors.blue[800],
    leading: IconButton(
        onPressed: () {
          if (cubitCrud.data.length > cubit.index) {
            cubitCrud.delete(cubit, id: cubitCrud.data[cubit.index].id);
          } else {
            cubit.index - 1;
          }
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red[400],
        )),
    title: const Text(
      "Branch / Store  / Cashier",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          cubitCrud.create(cubit);
        },
        icon: const Icon(
          Icons.add_circle,
          color: Colors.white,
          size: 30,
        ),
      ),
      IconButton(
        onPressed: () {
          if (ControllerData.formKey.currentState!.validate()) {
            cubitCrud.update(
              cubit,
              id: cubitCrud.data[cubit.index].id,
            );
          }
        },
        icon: const Icon(
          Icons.save,
          color: Colors.white,
          size: 30,
        ),
      ),
    ],
  );
}
