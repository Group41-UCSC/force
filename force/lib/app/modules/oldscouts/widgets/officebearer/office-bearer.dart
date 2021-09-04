import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class OfficeBearers extends StatefulWidget {
  OfficeBearers({Key? key}) : super(key: key);

  @override
  _OfficeBearersState createState() => _OfficeBearersState();
}

class _OfficeBearersState extends State<OfficeBearers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'The following Office Bearers were appointed at the Annual General Meeting\nof the Royal College Old Scouts Association, which was held on 15th\nAugust 2019 at the RCU Skills Center.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        SizedBox(height: 40),
        BootstrapRow(
          children: [
            BootstrapCol(sizes: 'col-md-6', child: Text('President')),
            BootstrapCol(
                sizes: 'col-md-6', child: Text('Mr. Samitha Wanasinghe')),
            BootstrapCol(
                sizes: 'col-md-12',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(),
                )),
            BootstrapCol(sizes: 'col-md-6', child: Text('Secretary')),
            BootstrapCol(
                sizes: 'col-md-6', child: Text('Mr. Praneeth Ratnayake')),
            BootstrapCol(
                sizes: 'col-md-12',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(),
                )),
            BootstrapCol(sizes: 'col-md-6', child: Text('Treasurer')),
            BootstrapCol(
                sizes: 'col-md-6', child: Text('Mr. Dhammika Ranasinghe')),
            BootstrapCol(
                sizes: 'col-md-12',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(),
                )),
            BootstrapCol(sizes: 'col-md-6', child: Text('Vice President')),
            BootstrapCol(sizes: 'col-md-6', child: Text('Mr. Pasan Jayakody')),
            BootstrapCol(
                sizes: 'col-md-12',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(),
                )),
            BootstrapCol(sizes: 'col-md-6', child: Text('Assistant Secretary')),
            BootstrapCol(
                sizes: 'col-md-6',
                child: Text('Mr. Thiranjaya Kandanarachchi')),
            BootstrapCol(
                sizes: 'col-md-12',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(),
                )),
            BootstrapCol(sizes: 'col-md-6', child: Text('Assistant Treasurer')),
            BootstrapCol(
                sizes: 'col-md-6', child: Text('Mr. Pramith Ruwanpathirana')),
            BootstrapCol(
                sizes: 'col-md-12',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(),
                )),
            BootstrapCol(sizes: 'col-md-6', child: Text('Committee Members')),
            BootstrapCol(
                sizes: 'col-md-6',
                child: Text(
                    'Mr. Kavinga Gunasekara\nMr. Gayanath Wijemanna\nMr. Wedisha Gankanda\nMr.Pavithra Nandasena\nMr. Mayuka Ranasinghe\nMr. Harindu Abeywardena\nMr. Prabudda Dissanayake\nMr. Ishan Rathnapala\nMr. Thanura Hewawasam\nMr. Vinura Perera\nMr. Nilanga Peris')),
          ],
        )
      ],
    );
  }
}
