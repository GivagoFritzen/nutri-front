import 'package:flutter/material.dart';
import 'package:nutri/enum/medidaCaseira.dart';
import 'package:nutri/models/alimento/alimentoViewModel.dart';

class DropdownMedidaCaseira extends StatefulWidget {
  AlimentoViewModel alimento;

  DropdownMedidaCaseira({Key? key, required this.alimento}) : super(key: key);

  @override
  State<DropdownMedidaCaseira> createState() => _DropdownMedidaCaseiraState();
}

class _DropdownMedidaCaseiraState extends State<DropdownMedidaCaseira> {
  String getName(MedidaCaseira value) {
    var enumComplete = value
        .toString()
        .replaceFirst((MedidaCaseira).toString(), "")
        .replaceFirst(".", "");

    final separateStringByUpperLetter = RegExp(r"(?=[A-Z])");

    var stringSeparated = enumComplete.split(separateStringByUpperLetter);
    return stringSeparated.join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<MedidaCaseira>(
      value: widget.alimento.medida,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (MedidaCaseira? value) {
        // This is called when the user selects an item.
        setState(() {
          widget.alimento.medida = value!;
        });
      },
      items: MedidaCaseira.values
          .map<DropdownMenuItem<MedidaCaseira>>((MedidaCaseira value) {
        return DropdownMenuItem<MedidaCaseira>(
          value: value,
          child: Text(getName(value)),
        );
      }).toList(),
    );
  }
}
