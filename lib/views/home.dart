import 'package:flutter/material.dart';
import 'package:yo_event/Views/cart_page.dart';
import 'package:yo_event/adds/create_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[650],
      // appBar: AppBar(
      //   title: Text("Its a beautiful day"),
      //   backgroundColor: Colors.grey[800],
      // ),
      body: Container(
        height: 550,
        padding: EdgeInsets.only(left: 10, top: 100, right: 10, bottom: 20),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[700],
                child: Center(child: const Text("E-Ticketing")),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: Center(child: const Text('Catering Services')),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[500],
                  child: Center(child: const Text('Sound Systems')),
                ),
                // onTap: () {
                //   Navigator.push(context, CartSection(context));
                // },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Center(child: const Text('Venues')),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: Center(child: const Text('Decorations')),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: Center(child: const Text('Chairs and Tents')),
              ),
            ),
          ],
        ),
      ),

      // Navigation_Bar(),
    );
  }
}

//OTHER HOMEPAGE LAYOUTS
class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EVENT HUB"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: 16,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.amberAccent,
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "$index . Am trying bro",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

int Counter = 0;

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Its a Real Work"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Counter += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 40,
                child: Image(
                  image: AssetImage("images/lady_bug.jpg"),
                ),
              ),
            ),
            Divider(
              height: 90,
              color: Colors.grey[800],
            ),
            Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Geoffrey",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ninja Level",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Level $Counter",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
