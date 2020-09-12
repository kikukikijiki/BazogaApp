import 'dart:async';
import 'package:bazoga/controllers/network_helper.dart';
import 'package:bazoga/models/hewan.dart';
import 'package:bazoga/pages/zoopedia_detail_page.dart';
import 'package:flutter/material.dart';

class Zoopedia extends StatefulWidget {
  @override
  _ZoopediaState createState() => _ZoopediaState();
}

class _ZoopediaState extends State<Zoopedia> {
  Future<Hewan> futureHewan;
  final _formKey = GlobalKey<FormState>();
  final List<IconData> icons = [Icons.view_stream, Icons.view_comfy];
  final List<int> view_grid = [2, 1];
  int view_option = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Zoopedia"),
          actions: [
            IconButton(
                icon: Icon(
                  icons[view_option],
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    view_option = 1 - view_option;
                  });
                })
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                              hintText: 'Cari Hewan',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                // Process data.
                              }
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: _hewansData(view_grid[view_option]),
              ))
            ],
          ),
        ));
  }
}

FutureBuilder _hewansData(view_grid) {
  return FutureBuilder<List<Hewan>>(
    future: GetHewans().getHewans(),
    builder: (BuildContext context, AsyncSnapshot<List<Hewan>> snapshot) {
      if (snapshot.hasData) {
        List<Hewan> data = snapshot.data;
        return _hewans(data, context, view_grid);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

GridView _hewans(data, context, view_grid) {
  double aspect_ratio;

  if (view_grid == 1) {
    aspect_ratio = (MediaQuery.of(context).size.width / 3) /
        (MediaQuery.of(context).size.height / 7);
  } else {
    aspect_ratio = (MediaQuery.of(context).size.width / 4) /
        (MediaQuery.of(context).size.height / 8);
  }

  return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: view_grid, childAspectRatio: aspect_ratio),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ZoopediaDetailPage(data[index])));
            },
            child: Card(child: _tile(data[index])));
      });
}

Hero _tile(Hewan hewan) {
  return Hero(
    tag: hewan,
    child: Material(
      type: MaterialType.transparency,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
                child: Image.network(
                    "http://www.kota103.my.id/assets/img/siamang1.jpg" /*+ hewan.gambar*/)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                hewan.nama_hewan,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// ListView _hewans(data) {
//   return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         print(data[index].id_hewan);
//         return Card(
//             child: _tile(data[index].id_hewan, data[index].nama_hewan,
//                 data[index].gambar));
//       });
// }

// ListTile _tile(String title, String subtitle, String icon) {
//   return ListTile(
//     title: Text(title,
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 20,
//         )),
//     subtitle: Text(subtitle),
//     leading: Image.network('http://www.kota103.my.id/assets/img/siamang.jpg'),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Zoopedia"),
//     ),
//     body: Container(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(20),
//             height: 150.0,
//             child: Row(
//               children: <Widget>[
//                 Flexible(
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'Cari Hewan',
//                     ),
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: RaisedButton(
//                     onPressed: () {
//                       // Validate will return true if the form is valid, or false if
//                       // the form is invalid.
//                       if (_formKey.currentState.validate()) {
//                         // Process data.
//                       }
//                     },
//                     child: Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: GridView.count(
//               // Create a grid with 2 columns. If you change the scrollDirection to
//               // horizontal, this produces 2 rows.
//               crossAxisCount: 2,
//               // Generate 100 widgets that display their index in the List.
//               children: List.generate(100, (index) {
//                 return Center(
//                   child: Text(
//                     'Item $index',
//                     style: Theme.of(context).textTheme.headline5,
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
