import 'package:flutter/material.dart';

class StartCardWidget extends StatefulWidget {
  final int value;
  final String title;

  const StartCardWidget({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  _StartCardWidgetState createState() => _StartCardWidgetState(value: this.value);
}

class _StartCardWidgetState extends State<StartCardWidget> {
  int value;

  _StartCardWidgetState({required this.value});

  bool _checkDecreaseButtonEnabled(int value) => value > 1;

  void _decrease() {
    setState(() {
      value -= 1;
    });
  }

  void _increase() {
    setState(() {
      value += 1;
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
