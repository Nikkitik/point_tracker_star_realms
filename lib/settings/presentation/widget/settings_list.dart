import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_list_cubit.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsListCubit, List<String>>(
      builder: (context, listInfo) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: listInfo.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              margin: EdgeInsets.all(2),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      listInfo[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
