import 'package:flutter/material.dart';


import 'package:band_names/models/band.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Metallica', vote: 5),
    Band(id: '2', name: 'Gorillaz', vote: 4),
    Band(id: '3', name: 'Beck', vote: 3),
    Band(id: '4', name: 'Octavia', vote: 9)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index])
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        child: Icon(Icons.add),
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print(direction);
        print(band.id);
        //TODO: LLamar el borrado en el server
      },
      background: Container(
        padding: EdgeInsets.only(left: 10.0),
        color: Colors.blue,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Borrar Banda', style: TextStyle(color: Colors.white)),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text( band.name.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.vote}', style: TextStyle(fontSize: 20)),
        onTap: (){
          print(band.name);
        },
      ),
    );
  }
  addNewBand(){

    final textController = new TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text('Add'),
                  textColor: Colors.blue,
                  elevation: 5,
                  onPressed: () => _addBandToList(textController.text)
              )
            ],
          );
        },
    );
  }
  void _addBandToList( String name){
    print(name);
    if(name.length > 1){
      //Podemos agregar
      this.bands.add(new Band(id: DateTime.now().toString(), name: name, vote: 2 ));
      setState(() {});
    }

    Navigator.pop(context);
  }

}

