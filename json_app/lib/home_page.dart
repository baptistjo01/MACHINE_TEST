import 'package:json_app/db_provider.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('FETCHING DATA'),
        centerTitle: true,
        //
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : myFetchingData(),
    );
  }

  myFetchingData() {
    return FutureBuilder(
      future: DBProvider.db.getAllData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data[index].avatar),
                ),
                title: Text(
                  "ID IS  ${snapshot.data[index].id} ",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${snapshot.data[index].email}',
                  style: TextStyle(color: Colors.teal),
                ),
              );
            },
          );
        }
      },
    );
  }
}
