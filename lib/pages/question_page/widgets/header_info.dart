import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/cubit/question_page_cubit.dart';
import 'package:quiz_game/utils/my_color.dart';

class HeaderInfo extends StatefulWidget {
  const HeaderInfo({
    super.key,
    required this.duration,
    required this.length,
  });

  final Duration duration;
  final int length;

  @override
  State<HeaderInfo> createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<QUestionPageCubit, int>(
          builder: (context, state) => Text(
            'Quiz: ${state + 1} of ${widget.length}',
            style: const TextStyle(
              fontFamily: 'pop-regular',
              fontSize: 20,
              color: MyColor.gray,
            ),
          ),
        ),
        Text(
          'Time: ${widget.duration.inMinutes}:${widget.duration.inSeconds.remainder(60)}',
          style: const TextStyle(
            fontFamily: 'pop-regular',
            fontSize: 20,
            color: MyColor.gray,
          ),
        ),
      ],
    );
  }
}
