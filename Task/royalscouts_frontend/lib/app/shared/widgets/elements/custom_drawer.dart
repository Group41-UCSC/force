import 'package:flutter/material.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/configs/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColor.primary,
            ),
            child: Text(
              'Logo',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text('Task Home'),
            onTap: () => Navigator.pushReplacementNamed(
              context,
              Routes.taskHome,
            ),
          ),
          ListTile(
            title: const Text('Task Evaluation'),
            onTap: () => Navigator.pushReplacementNamed(
              context,
              Routes.taskEvaluation,
            ),
          ),
        ],
      ),
    );
  }
}
