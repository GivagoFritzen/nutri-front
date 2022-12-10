import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DropdownfieldLanguage extends StatefulWidget {
  @override
  _DropdownfieldLanguageState createState() => _DropdownfieldLanguageState();
}

class _DropdownfieldLanguageState extends State<DropdownfieldLanguage> {
  GlobalKey? dropdownButtonKey = GlobalKey();

  late LocalizationDelegate localizationDelegate;
  String currentLanguage = "";
  var languages = [
    'pt',
    'en',
  ];

  @override
  void initState() {
    super.initState();
  }

  void openDropdown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext? element) {
      element?.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
        } else {
          searchForGestureDetector(element);
        }
      });
    }

    searchForGestureDetector(dropdownButtonKey?.currentContext);
    assert(detector != null);

    detector?.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    final dropdown = DropdownButton<int>(
      key: dropdownButtonKey,
      items: [
        for (int i = 0; i < languages.length; i++)
          DropdownMenuItem(
            value: i,
            child: Text(
              languages[i],
              style: const TextStyle(color: Colors.black),
            ),
          )
      ],
      onChanged: (int? value) {
        localizationDelegate.changeLocale(new Locale(languages[value!]));
        //Navigator.pushNamed(context, ModalRoute.of(context)!.settings.name!);
        Navigator.pop(context, '');
      },
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Offstage(child: dropdown),
        TextButton(
          onPressed: openDropdown,
          child: Text(
            translate('top_bar.idioma'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
