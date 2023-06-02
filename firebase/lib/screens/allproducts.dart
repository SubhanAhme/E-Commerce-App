import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addproduct.dart';

class AllProductsView extends StatelessWidget {
  AllProductsView({super.key});
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
            future: getAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // return ListView.builder(
                //     itemCount: snapshot.data.docs.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(snapshot.data.docs[index]['name']),
                //         subtitle: Row(
                //           children: [
                //             Text(snapshot.data.docs[index]['price']),
                //             Text("Rs")
                //           ],
                //         ),
                //       );
                //     });
                return GridView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[100]
                        
                      ),
                     
                        child: Column(
                          children: [
                           Container(
                            child:  Image.network(snapshot.data.docs[index]['url']),
                           ),
          
                            // Text(snapshot.data.docs[index]['name'], style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            // SizedBox(height: 5,width: 40,),
                            // Text(snapshot.data.docs[index]['price'], style: TextStyle(fontSize: 10,color: Colors.grey),),
                          
                          ],
                        ),
                      
                    );
                  },
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
