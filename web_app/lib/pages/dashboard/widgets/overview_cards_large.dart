import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/dashboard/widgets/info_card.dart';


class OverviewCardsLargeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Row(
              children: [
                InfoCard(
                  title: "Events in progress",
                  value: "7",
                  onTap: () {},
                  topColor: Colors.orange,
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Completed Events",
                  value: "17",
                  topColor: Colors.lightGreen,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Cancelled Events",
                  value: "3",
                  topColor: Colors.redAccent,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Scheduled Events",
                  value: "32",
                  onTap: () {},
                ),
              ],
            );
  }
}