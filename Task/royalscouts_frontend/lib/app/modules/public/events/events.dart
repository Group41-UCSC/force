import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:royalscouts/app/shared/layout/app_layout.dart';
import 'package:royalscouts/app/shared/widgets/banner/banner_01.dart';
import 'package:royalscouts/app/shared/widgets/elements/nav_link.dart';

class Events extends StatefulWidget {
  Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        bannerBackgroundImage: 'images/banner/banner-01.jpg',
        banner: Banner01(title: ''),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
              child: Text('Upcoming Events',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(60, 72, 88, 1))),
            ),
            SizedBox(height: 20),
            Container(
                height: 100,
                width: 600,
                color: Colors.blueGrey[200],
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text('EVENTS FROM'),
                          Container(
                            width: 100,
                            height: 30,
                            child: TextButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2032, 1, 1),
                                      onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Text(
                                    '${DateTime.now().year}-${(DateTime.now().month + 1).toString().padLeft(2, '0')}')),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text('SEARCH')),
                          Container(
                            width: 100,
                            height: 30,
                            padding: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                                decoration:
                                    InputDecoration(hintText: 'keyword')),
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('FIND EVENTS'),
                            ))),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              width: 80,
                              alignment: Alignment.centerLeft,
                              child: Text('VIEW')),
                          DropdownButton<String>(
                            value: 'List',
                            onChanged: (String? newValue) {},
                            items: <String>[
                              'List',
                              'Month',
                              'Day',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                width: 600,
                color: Color.fromRGBO(217, 237, 247, 1),
                padding: const EdgeInsets.all(8),
                child: Text('There were no results found.',
                    style: TextStyle(fontSize: 17))),
            SizedBox(height: 20),
            Container(
              width: 600,
              child: Divider(),
            ),
            SizedBox(height: 20),
            Container(
              width: 600,
              alignment: Alignment.centerLeft,
              child: NavLink(
                  text: '<< Previous Events',
                  defaultColor: Colors.black,
                  onHoverColor: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20)
          ],
        ));
  }
}
