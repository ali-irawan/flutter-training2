import 'package:flutter/material.dart';
import 'model.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround  ,
          children: <Widget>[
            RaisedButton(
              child: Text('Launch screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            RaisedButton(
              child: Text('Launch screen with data'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen("Some title")),
                );
              },
            ),
            RaisedButton(
              child: Text('Launch screen with Arguments'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  InfoScreen.routeName,
                  arguments: Contact(
                    "John",
                    "john@gmail.com",
                  ),
                );
              },
            ),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String title;

  SecondScreen([this.title = 'default']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


class InfoScreen extends StatelessWidget {
  static const routeName = '/info';

  @override
  Widget build(BuildContext context) {

    final Contact arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column (
          children: <Widget>[
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Email: "),
                Text(arguments.email),
              ],
            )
          ],
        )
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Delete'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("You choose $result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Are you sure ?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "Y");
                },
                child: Text('Yes'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "N");
                },
                child: Text('No'),
              ),
            )
          ],
        ),
      ),
    );
  }
}