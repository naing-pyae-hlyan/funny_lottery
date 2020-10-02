import 'package:aung_bar_lay/utils/mm_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showCharBottomSheet(BuildContext context,
    {ValueChanged<String> valueChanged}) async {
  Future.delayed(
      Duration.zero,
      () => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(64.0),
                      // topRight: Radius.circular(16.0)
                    ),
                    color: Colors.white),
                child: PickerItems(valueChanged: valueChanged));
          }));
}

class PickerItems extends StatefulWidget {
  final ValueChanged<String> valueChanged;

  PickerItems({this.valueChanged});

  @override
  _PickerItemsState createState() => _PickerItemsState();
}

class _PickerItemsState extends State<PickerItems> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 66,
      children: _getCharList(context),
      onSelectedItemChanged: (index) {
        // print('mChar: ${MMUtils.mmChar[index]}');
        widget.valueChanged.call(MMUtils.mmChar[index]);
      },
    );
  }

  List<Widget> _getCharList(BuildContext context) {
    List<Widget> widgets = List();
    for (var t in MMUtils.mmChar) {
      widgets.add(_charListTiles(context, t));
    }
    return widgets;
  }

  Widget _charListTiles(BuildContext context, String text) {
    return Text(text);
  }
}
