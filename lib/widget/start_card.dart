import 'package:flutter/material.dart';

class StartCardWidget extends StatefulWidget {
  final int value;
  final String title;
  final Function(int) onChangeValue;

  const StartCardWidget({
    Key? key,
    required this.value,
    required this.title,
    required this.onChangeValue,
  }) : super(key: key);

  @override
  _StartCardWidgetState createState() => _StartCardWidgetState(
      value: this.value, onSelectParam: this.onChangeValue);
}

class _StartCardWidgetState extends State<StartCardWidget> {
  int value;
  Function(int) onSelectParam;

  _StartCardWidgetState({required this.value, required this.onSelectParam});

  bool _checkDecreaseButtonEnabled(int value) => value > 1;

  void _decrease() {
    setState(() {
      value -= 1;
      onSelectParam(value);
    });
  }

  void _increase() {
    setState(() {
      value += 1;
      onSelectParam(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _checkDecreaseButtonEnabled(value)
                      ? () => _decrease()
                      : null,
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => _increase(),
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
