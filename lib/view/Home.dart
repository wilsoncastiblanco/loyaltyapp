import 'package:flutter/material.dart';
import 'package:loyaltapp/model/Quake.dart';
import 'package:loyaltapp/model/QuakeService.dart';
import 'QuakeBody.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.pinkAccent,
            title: new Text("BMI"),
            centerTitle: true),
        body: new Center(
            child: new Container(
          child: FutureBuilder(
              future: getQuakes(),
              builder: (BuildContext context, AsyncSnapshot<List<Quake>> snapshot) {
                return snapshot.hasData && snapshot.connectionState == ConnectionState.done
                    ? new ListView.builder(
                        itemCount: snapshot.data.length,
                        padding: const EdgeInsets.all(4.4),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Divider(height: 3.4),
                              ListTile(
                                title: Text(snapshot.data[index].title),
                                onTap: ()=> debugPrint("$index"),
                              )
                            ],
                          );
                        })
                    : CircularProgressIndicator();
              }),
        )));
  }
}
