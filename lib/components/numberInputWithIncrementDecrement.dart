import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputWithIncrementDecrement extends StatefulWidget {
  TextEditingController controller;
  double height;
  double width;

  NumberInputWithIncrementDecrement(
      {super.key, required this.controller, this.height = 45, this.width = 60});

  @override
  _NumberInputWithIncrementDecrementState createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = "0";
  }

  Container increaseButton() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
          ),
        ),
      ),
      child: InkWell(
        child: const Icon(
          Icons.arrow_drop_up,
          size: 18.0,
        ),
        onTap: () {
          int currentValue = int.parse(widget.controller.text);
          setState(() {
            currentValue++;
            widget.controller.text = (currentValue).toString();
          });
        },
      ),
    );
  }

  InkWell decreaseButton() {
    return InkWell(
      child: const Icon(
        Icons.arrow_drop_down,
        size: 18.0,
      ),
      onTap: () {
        int currentValue = int.parse(widget.controller.text);
        setState(() {
          currentValue--;
          widget.controller.text =
              (currentValue > 0 ? currentValue : 0).toString();
        });
      },
    );
  }

  @override
  Container build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.blueGrey,
          width: 2.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              controller: widget.controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          SizedBox(
            height: 38.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                increaseButton(),
                decreaseButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
