import 'package:flutter/material.dart';
import 'package:nutri/utils/colors.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 100,
          height: double.infinity,
          color: ColorUtil.darkGrey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle_outlined)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle_outlined)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
