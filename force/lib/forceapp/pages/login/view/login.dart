import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

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
              //   widget.title,
              //   style: GoogleFonts.poppins(),
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
                  color: Colors.amber,
                ),
              ],
            ),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.all(20),
              // childAspectRatio: 3 / 2,
              children: [
                Column(
                  children: [
                      Align(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                          child: Text(
                          "Hi, Nilukshan!", 
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ),
                      ), 
                      Card(
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                                  child: Text(
                                    "ONGOING EVENT",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      textStyle: TextStyle(
                                      color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    "55th Colombo Camporee",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,                                    
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: Text(
                                    "20 Dec 2020 - 27 Dec 2020",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,                                   
                                    ),
                                  ),
                                ),
                              ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                // alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                  ),
                                  onPressed: () {
                                      // Respond to button press
                                  },
                                  child: Text(
                                    'Attend', 
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,                                   
                                    ),
                                  ),
                                ),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Column(),
              ],
            ),
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