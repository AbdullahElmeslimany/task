import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/logic/crud_cubit/crud_cubit.dart';
import '../../controller/logic/handle_cubit/handle_page_cubit.dart';

class ButtomBar extends StatelessWidget {
  const ButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HandlePageCubit>(context);
    final cubitCRUD = BlocProvider.of<CrudCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            cubit.pageController.jumpToPage(0);
          },
          icon: Icon(
            Icons.keyboard_double_arrow_left_rounded,
            color: Colors.blue[900],
          ),
        ),
        IconButton(
          onPressed: () {
            cubit.pageController.jumpToPage(cubit.index - 1);
          },
          icon: Icon(
            Icons.arrow_left_rounded,
            size: 50,
            color: Colors.blue[900],
          ),
        ),
        BlocBuilder<HandlePageCubit, HandlePageState>(
          builder: (context, state) {
            return BlocBuilder<CrudCubit, CrudState>(
              builder: (context, state) {
                return Text(
                  "${cubit.index + 1}/${cubitCRUD.data.length}",
                  // "${cubit.index + 1}/${cubit.length}",
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                );
              },
            );
          },
        ),
        IconButton(
          onPressed: () {
            cubit.pageController.jumpToPage(cubit.index + 1);
          },
          icon: Icon(
            Icons.arrow_right_rounded,
            size: 50,
            color: Colors.blue[900],
          ),
        ),
        IconButton(
          onPressed: () {
            cubit.pageController.jumpToPage(cubitCRUD.data.length - 1);
          },
          icon: Icon(
            Icons.keyboard_double_arrow_right_rounded,
            color: Colors.blue[900],
          ),
        ),
      ],
    );
  }
}
