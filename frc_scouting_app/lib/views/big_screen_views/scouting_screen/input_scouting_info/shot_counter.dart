import 'package:flutter/material.dart';

class ShotCounter extends StatefulWidget{
  // TODO: make count = 0 and not required
  ShotCounter({
    required this.title,
    required this.onChange,
    required this.count
  });

  final String title;
  final void Function(int) onChange;
  int count;

  @override
  State<StatefulWidget> createState() => _ShotCounterState();
}

class _ShotCounterState extends State<ShotCounter> {

  get _incButton => incrementButton();
  get _decButton => decrementButton();

  void _increment() {
    setState(() {
      if(widget.count < 1000) widget.count++;
    });
    widget.onChange(widget.count);
  }

  void _decrement() {
    setState(() {
      if(widget.count > 0) widget.count--;
    });
    widget.onChange(widget.count);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.title, 
        style: const TextStyle(
          fontSize: 20,
          color: Colors.grey
        )
        ),
        _incButton,
        Text('${widget.count}',
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white60
        )),
        _decButton
      ]
    );
  }

  incrementButton() {
    return IconButton(
      onPressed: _increment, 
      icon: const Icon(Icons.keyboard_arrow_up, color: Colors.lightGreen),
      );
  }

  decrementButton() {
    return IconButton(
      onPressed: _decrement, 
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.redAccent),
      );
  }
}