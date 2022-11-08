import 'package:flutter/material.dart';
import 'package:nutri/services/tacoService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';

class Dropdownfield extends StatefulWidget {
  String? labelText = "";
  TextEditingController textEditingController;
  final Function(String val) updateValue;

  Dropdownfield({Key? key,
    required this.textEditingController,
    required this.updateValue,
    this.labelText})
      : super(key: key);

  @override
  _DropdownfieldState createState() => _DropdownfieldState();
}

class _DropdownfieldState extends State<Dropdownfield> {
  late TacoService tacoService;
  final _dropdownScrollController = ScrollController();

  bool showDropdown = false;
  int currentPage = 0;
  List<String>? options = <String>[];

  @override
  void initState() {
    tacoService = Provider.of<TacoService>(context, listen: false);

    _dropdownScrollController.addListener(() {
      if (_dropdownScrollController.position.maxScrollExtent ==
          _dropdownScrollController.offset) {
        loadOptions();
      }
    });

    super.initState();
  }

  SizedBox dropdownBelow(String text) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtil.blue,
            minimumSize: const Size(double.infinity, 45),
          ),
          onPressed: () {
            widget.textEditingController.text = text;
            widget.updateValue(text);
            setState(() {
              showDropdown = false;
            });
          },
          child: Text(
            text,
            //style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  SizedBox dropdownList() {
    return SizedBox(
      height: 100,
      child: Scrollbar(
        thumbVisibility: true,
        controller: _dropdownScrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _dropdownScrollController,
          child: Column(
            children: [
              for (var option in options!) dropdownBelow(option),
            ],
          ),
        ),
      ),
    );
  }

  void loadOptions() async {
    var response = await tacoService.getTacoByPagination(
        descricao: widget.textEditingController.text,
        paginaAtual: currentPage,
        tamanhoPagina: 10);

    if (response.body!.total! > options!.length) {
      setState(() {
        options
            ?.addAll((response.body!.data?.map((e) => e.descricao).toList())!);
        currentPage += 1;
      });
    }
  }

  @override
  SizedBox build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          TextField(
            onChanged: (text) async {
              widget.updateValue(text);
              setState(() {
                currentPage = 0;
                options = <String>[];
                loadOptions();
              });
            },
            controller: widget.textEditingController,
            decoration: InputDecoration(
              labelText: widget.labelText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showDropdown = !showDropdown;
                    options = <String>[];
                    currentPage = 0;
                  });

                  if (showDropdown) {
                    loadOptions();
                  }
                },
                icon: const Icon(Icons.arrow_downward_sharp),
              ),
            ),
          ),
          showDropdown == true && options != null && options!.isNotEmpty
              ? dropdownList()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
