import 'package:flutter/material.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';

class LeftBar extends StatelessWidget {
  //LeftBar({Key? key}) : super(key: key);

  LeftBar({super.key, context}) {
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);
  }

  late LocalStorageService localStorageService;

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
              child: Tooltip(
                message: 'Perfil',
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/nutri/perfil');
                    },
                    icon: const Icon(Icons.account_circle_outlined)),
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Tooltip(
                message: 'Pacientes',
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/nutri/pacientes');
                    },
                    icon: const Icon(Icons.people_outline)),
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Tooltip(
                message: 'Adicionar Paciente',
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/paciente');
                    },
                    icon: const Icon(Icons.person_add_alt_1_outlined)),
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Tooltip(
                message: 'Sair',
                child: IconButton(
                    onPressed: () {
                      localStorageService.clean();
                      Navigator.pushNamed(context, '/login');
                    },
                    icon: const Icon(Icons.close)),
              )),
        ],
      ),
    );
  }
}
