import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:date_field/date_field.dart';
import 'package:email_validator/email_validator.dart';

import 'forceapp/config/palette.dart'; 

import 'package:force/app/modules/about/pages/about.dart';
import 'package:force/app/modules/contact_us/pages/contact_us.dart';
import 'package:force/app/modules/events/events.dart';
import 'package:force/app/modules/gallery/gallery.dart';
import 'package:force/app/modules/homepage/homepage.dart';
import 'package:force/app/modules/news/pages/news.dart';
import 'package:force/app/modules/news/pages/news_content.dart';
import 'package:force/app/modules/oldscouts/old-scouts.dart';

import 'package:force/forceapp/login/login.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/news': (context) => News(),
        '/news-content': (context) => NewsContent(),
        '/about': (context) => About(),
        '/gallery': (context) => Gallery(),
        '/contactus': (context) => ContactUs(),
        '/oldscouts': (context) => OldScouts(),
        '/events': (context) => Events()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  _getDrawerFragment(int pos) {
    switch (pos) {
      case 0:
        return new AddScout();
      case 1:
        return new AddScout();
      case 2:
        return new AddScout();
      case 3:
        return new Councils();
      case 4:
        return new AddScout();
      case 5:
        return new AddScout();

      default:
        return new Text("Error");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Force_Logo',
                  style: GoogleFonts.poppins(),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard',style: GoogleFonts.poppins(),),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
              ),
              ListTile(
                leading: Icon(Icons.emoji_events_rounded),
                title: Text('Progress Card',style: GoogleFonts.poppins(),),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
              ),
              ListTile(
                leading: Icon(Icons.event_rounded),
                title: Text('Events',style: GoogleFonts.poppins(),),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
              ListTile(
                leading: Icon(Icons.groups_rounded),
                title: Text('Councils',style: GoogleFonts.poppins(),),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
              ListTile(
                leading: Icon(Icons.star_rounded),
                title: Text('Badgeworks',style: GoogleFonts.poppins(),),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
              ),
              ListTile(
                leading: Icon(Icons.help_rounded),
                title: Text('Help',style: GoogleFonts.poppins(),),
                selected: _selectedDestination == 5,
                onTap: () => selectDestination(5),
              ),
            ],
          ),
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              // title: Text(
              //   "Force_Logo",
              //   style: GoogleFonts.poppins(color: Colors.black,),
              //   ),
              actions: [
                IconButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    print('Search Bar');
                  },
                  icon: Icon(Icons.search, color: Colors.black,),
                ),
                IconButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    print('Search Bar');
                  },
                  icon: Icon(Icons.settings, color: Colors.black,),
                ),
                IconButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    print('Search Bar');
                  },
                  icon: Icon(Icons.notifications, color: Colors.black,),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            body: _getDrawerFragment(_selectedDestination),
          ),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}


class AddScout extends StatefulWidget {
  @override
  AddScoutState createState() {
    return AddScoutState();
  }
}

class AddScoutState extends State<AddScout> {
  bool _isValid = false;
  String? dropDownValue;
  List<String> scoutSection = [
    'Junior Scout',
    'Senior Scout',
    'Scout Leader',
    'Old Scout',
  ];

  @override
  void initState() {
    //setFilters();
    super.initState();
  }

  setFilters() {
    setState(() {
      dropDownValue = scoutSection[2];
    });
  }

  showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("OK"),
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)
    ),
    onPressed:  () {},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Scout added successfully!"),
    content: Text("Notify your scout to check their inbox to receive credentials to their account."),
    actions: [
      cancelButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          child: Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
            child: Text(
            "Add a Scout", 
            style: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 16),
          child: TextFormField(
            // cursorColor: Theme.of(context).cursorColor,
            // initialValue: 'Input text',
            // maxLength: 20,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
              helperText: 'Enter the full name of the scout seperated by spaces',
              // suffixIcon: Icon(
              //   Icons.check_circle,
              // ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 16),
          child: TextFormField(
            // cursorColor: Theme.of(context).cursorColor,
            // initialValue: 'Input text',
            // maxLength: 20,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Preferred Name',
              helperText: 'Probably the First Name which is used to identify the scout',
              // suffixIcon: Icon(
              //   Icons.check_circle,
              // ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 16),
          child:DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                labelText: 'Scout Section',
                helperText: 'Select from the Drop Down Menu',
                // hintText: "Scout Section",
            ),
            value: dropDownValue,
            onChanged: (String? value) {
              setState(() {
                dropDownValue = value;
              });
            },
            items: scoutSection
                .map((section) => DropdownMenuItem(
                    value: section, child: Text("$section")))
                .toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 16),
          child: DateTimeFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.event_note),
              labelText: 'Date of Birth',
              helperText: 'According to the Birth Certificate',
            ),
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Address',
                helperText: _isValid ? 'Email is valid.' : 'Enter a valid Email Address.',
            ),
            onChanged: (value) => {
              setState(() {
                _isValid = EmailValidator.validate(value);
              }),
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 16),
          child: Container(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              onPressed: () {
                  // Respond to button press
                  showAlertDialog(context);
              },
              child: Text(
                'Add Scout', 
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,                               
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Councils extends StatefulWidget {

  @override
  _CouncilsState createState() => _CouncilsState();
}

class _CouncilsState extends State<Councils> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Container(
                child: 
                  Column(
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child:
                        Icon(
                          Icons.group,
                          size: 70.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                    ),
                    Align(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Patrol Leaders' Council",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,                                    
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        // padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {
                              // Respond to button press
                          },
                          child: Text(
                            'View', 
                            style: GoogleFonts.poppins(
                              fontSize: 14,                                   
                            ),
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
              ),
            ),
            Card(
              child: Container(
                child: 
                  Column(
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child:
                        Icon(
                          Icons.group,
                          size: 70.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                    ),
                    Align(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Instructors' Council",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,                                    
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        // padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {
                              // Respond to button press
                          },
                          child: Text(
                            'View', 
                            style: GoogleFonts.poppins(
                              fontSize: 14,                                   
                            ),
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
              ),
            ),
            Card(
              child: Container(
                child: 
                  Column(
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child:
                        Icon(
                          Icons.group,
                          size: 70.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                    ),
                    Align(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Scouters' Council",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,                                    
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        // padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {
                              // Respond to button press
                          },
                          child: Text(
                            'View', 
                            style: GoogleFonts.poppins(
                              fontSize: 14,                                   
                            ),
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}