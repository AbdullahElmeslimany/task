import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task/view/buttom_bar/buttom_bar.dart';
import '../../controller/data_controller/data_controller.dart';
import '../../controller/logic/crud_cubit/crud_cubit.dart';
import '../../controller/logic/handle_cubit/handle_page_cubit.dart';
import 'helper/title_and_textfield.dart';

class BigScreen extends StatelessWidget {
  const BigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HandlePageCubit>(context);
    final cubitCRUD = BlocProvider.of<CrudCubit>(context);
    cubitCRUD.read();
    return BlocBuilder<CrudCubit, CrudState>(
      builder: (context, state) {
        print(state);
        if (state is LoadingState) {
          const Center(child: CircularProgressIndicator());
        }
        cubit.firstlength(cubitCRUD: cubitCRUD);
        return Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<HandlePageCubit, HandlePageState>(
                  builder: (context, state) {
                    return PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: cubit.pageController,
                      itemCount: cubit.length,
                      onPageChanged: (value) {
                        cubit.changePage(pageindex: value);
                        cubit.handleData(cubitCRUD: cubitCRUD, value: value);
                      },
                      itemBuilder: (context, index) {
                        return Form(
                          key: ControllerData.formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        titleAndTextFieldBig(context,
                                            controller:
                                                ControllerData.branchController,
                                            title: "Branch",
                                            enabel: false),
                                        const Gap(25),
                                        titleAndTextFieldBig(context,
                                            ltr: false,
                                            controller: ControllerData
                                                .arabicNameController,
                                            title: "Arabic Name"),
                                        const Gap(25),
                                        titleAndTextFieldBig(context,
                                            controller: ControllerData
                                                .englishNameController,
                                            title: "English Name"),
                                        const Gap(25),
                                        titleAndTextFieldBig(
                                          context,
                                          controller:
                                              ControllerData.noteController,
                                          title: "Note",
                                          maxLines: 4,
                                        ),
                                        const Gap(25),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Gap(8),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        titleAndTextFieldBig(context,
                                            controller: ControllerData
                                                .customNoController,
                                            title: "Custom No."),
                                        const Gap(25),
                                        titleAndTextFieldBig(context,
                                            controller: ControllerData
                                                .arabicDescriptionController,
                                            ltr: false,
                                            title: "Arabic Description"),
                                        const Gap(25),
                                        titleAndTextFieldBig(context,
                                            controller: ControllerData
                                                .englishDescriptionController,
                                            title: "English Description"),
                                        const Gap(25),
                                        titleAndTextFieldBig(context,
                                            controller: ControllerData
                                                .addressController,
                                            title: "Address"),
                                        const Gap(25),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
  }
}
