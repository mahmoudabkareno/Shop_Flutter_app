import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCatogory extends StatefulWidget {
  @override
  _AllCatogoryState createState() => _AllCatogoryState();
}

class _AllCatogoryState extends State<AllCatogory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Categories'),
      ),
      body: _getCatogories(),
    );
  }

  Widget _getCatogories() {
    CollectionReference categories =
        FirebaseFirestore.instance.collection('Categories');
    return StreamBuilder<QuerySnapshot>(
      stream: categories.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ListTile(
              title: Text(document.data()['categoryTitle']),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    categories.doc(document.id).delete();
                  }),
            );
          }).toList(),
        );
      },
    );
  }
}
