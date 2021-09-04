import 'package:flutter/material.dart';
import 'package:force/forceapp/login/constants/controllers.dart';
import 'package:force/forceapp/login/helpers/reponsiveness.dart';
import 'package:force/forceapp/login/pages/events/widgets/clients_table.dart';
import 'package:force/forceapp/login/widgets/custom_text.dart';
import 'package:get/get.dart';

class BadgeWorksPage extends StatelessWidget {
  const BadgeWorksPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
         return Container(
                child: Column(
                children: [
                 Obx(() => Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:
                        ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                        child: CustomText(text: menuController.activeItem.value, size: 24, weight: FontWeight.bold,)),
                    ],
                  ),),

                  Expanded(child: ListView(
                    children: [
                      Clientstable(),
                    ],
                  )),

                  ],
                ),
              );
  }
}