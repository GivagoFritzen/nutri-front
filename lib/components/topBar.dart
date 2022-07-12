import 'package:flutter/material.dart';
import 'package:nutri/utils/colors.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final TextEditingController _filter = TextEditingController();

  String _searchText = "";
  Icon _searchIcon = const Icon(Icons.search, color: Colors.white);

  _TopBarState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _searchIcon = const Icon(Icons.search, color: Colors.white);
        });
      } else {
        setState(() {
          _searchText = _filter.text;
          _searchIcon = const Icon(Icons.clear, color: Colors.white);
        });
      }
    });
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorUtil.green,
      title: Row(children: [
        const Text("Logo"),
        Expanded(
          child: _searchBar(),
        ),
        const Text("Nome do Usuário")
      ]),
      automaticallyImplyLeading: false,
    );
  }

  void _searchPressed() {
    if (_filter.text.isNotEmpty) {
      setState(() {
        _searchText = _filter.text = "";
        _searchIcon = const Icon(Icons.search, color: Colors.white);
      });
    }
  }

  Container _searchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.3),
      ),
      child: TextField(
        controller: _filter,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search....',
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: IconButton(
            onPressed: _searchPressed,
            icon: _searchIcon,
          ),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
    );
  }
}