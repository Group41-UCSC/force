import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BootstrapRow(height: MediaQuery.of(context).size.height, children: <BootstrapCol>[
      BootstrapCol(
        sizes: 'col-sm-12 col-md-6',
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 100, left: 30),
              child: Text(
                'Get in Touch',
                style: TextStyle(
                    fontSize: 41.6,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Text(
                'If you have any questions please don\'t hesitate to call us, or reach us through our contact form',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Text(
                '42nd Colombo Scout Group – Gold Troop, Royal College, Colombo 07, Sri Lanka.',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      BootstrapCol(
        sizes: 'col-sm-12 col-md-6',
        child: Container(
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(5)),
          margin: const EdgeInsets.fromLTRB(100, 30, 30, 30),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(40, 27, 153, 1),
                    borderRadius: BorderRadiusDirectional.circular(5)),
                padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Your Email'),
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Subject'),
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(labelText: 'Message'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(40, 27, 153, 1)),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "SEND MESSAGE",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
