import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/controller/logic/crud_cubit/crud_cubit.dart';
import 'package:task/view/small_screen/small_screen.dart';
import '../../controller/data_controller/data_controller.dart';
import '../../controller/logic/handle_cubit/handle_page_cubit.dart';
import '../big_screen/big_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HandlePageCubit>(context);
    final cubitCrud = BlocProvider.of<CrudCubit>(context);
    cubit.init();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          // leading: IconButton(onPressed: () {cubitCrud.delete(id: cubitCrud.data[cubit.index].id);},icon: Icon(Icons.delete,color: Colors.red[400],)),
          title: const Text(
            "Branch / Store  / Cashier",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                if (cubit.index <= cubitCrud.data.length - 1) {
                  cubit.changelength();
                  cubit.pageController.jumpToPage(cubit.length);
                } else {
                  if (ControllerData.formKey.currentState!.validate()) {
                    cubitCrud.create();
                  }
                }
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
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 700) {
              return const BigScreen();
            }
            return const SmallScreen();
          },
        ),
      ),
    );
  }
}
