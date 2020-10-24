import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllProduct extends StatefulWidget {
  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
      ),
      body: _getProduct(),
    );
  }

  Widget _getProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection('Products');
    return StreamBuilder<QuerySnapshot>(
      stream: products.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );;
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ListTile(
              title: Text(document.data()['productTitle']),
              trailing: IconButton(
                  icon: Icon(Icons.delete,color: Colors.red,),
                  onPressed: (){
                    products.doc(document.id).delete();
                  }),
              subtitle: Text(document.data()['productPrice']),
              onTap: () {
                Text(document.data()['productDiscription']);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
