import 'package:flutter/material.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({required this.elementsInfo, Key? key}) : super(key: key);

  final List<SettingsElementInfo> elementsInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: elementsInfo.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          margin: EdgeInsets.all(2),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    elementsInfo[index].name,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  elementsInfo[index].health.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
