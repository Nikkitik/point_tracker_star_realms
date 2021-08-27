import 'package:flutter/material.dart';

class HealthWidget extends StatefulWidget {
  const HealthWidget({Key? key}) : super(key: key);

  @override
  _HealthWidgetWidgetState createState() => _HealthWidgetWidgetState();
}

class _HealthWidgetWidgetState extends State<HealthWidget> {
  int _health = 50;

  bool _checkDecreaseButtonEnabled(int value) => value > 1;

  void _decreaseHealth() {
    setState(() {
      _health -= 1;
    });
  }

  void _increaseHealth() {
    setState(() {
      _health += 1;
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
              'Жизни',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '$_health',
              style: TextStyle(
                fontSize: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _checkDecreaseButtonEnabled(_health)
                      ? () => _decreaseHealth()
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
                  onPressed: () => _increaseHealth(),
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
