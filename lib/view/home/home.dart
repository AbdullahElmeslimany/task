import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/controller/logic/crud_cubit/crud_cubit.dart';
import '../../controller/data_controller/data_controller.dart';
import '../../controller/logic/handle_cubit/handle_page_cubit.dart';
import '../buttom_bar/buttom_bar.dart';
import '../screen/screen.dart';
import '../app_bar/app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HandlePageCubit>(context);
    final cubitCrud = BlocProvider.of<CrudCubit>(context);
    cubit.init();
    cubitCrud.read(cubit);

    return SafeArea(
      child: Scaffold(
        appBar: appBar(cubitCrud, cubit),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return BlocBuilder<CrudCubit, CrudState>(
              builder: (context, state) {
                cubit.firstlength(cubitCRUD: cubitCrud);
                return Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Expanded(
                        child: BlocBuilder<HandlePageCubit, HandlePageState>(
                          builder: (context, state) {
                            return Form(
                              key: ControllerData.formKey,
                              child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: cubit.pageController,
                                itemCount: cubitCrud.data.length,
                                onPageChanged: (value) {
                                  cubit.changePage(pageindex: value);
                                  cubit.handleData(
                                      cubitCRUD: cubitCrud, value: value);
                                },
                                itemBuilder: (context, index) {
                                  return constraints.maxWidth > 700
                                      ? newScreen(context)
                                      : smoothU(context);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const ButtomBar()
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
