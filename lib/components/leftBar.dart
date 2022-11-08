import 'package:flutter/material.dart';
import 'package:nutri/utils/colors.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({Key? key}) : super(key: key);

  static double GetWidth() {
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetWidth(),
      height: double.infinity,
      color: ColorUtil.darkGrey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/nutri/perfil');
                },
                icon: const Icon(Icons.account_circle_outlined)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/nutri/pacientes');
                },
                icon: const Icon(Icons.people_outline)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/paciente');
                },
                icon: const Icon(Icons.person_add_alt_1_outlined)),
          ),
        ],
      ),
    );
  }
}
