import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addproduct.dart';
import 'detailView.dart';

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
      
      body: Container(
      
        
        child: Column(
          children: [
            Container(
              child: Center(
                child: SizedBox(
                  height: 80,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border:InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[250],
                      labelText: "Search Here"
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: FutureBuilder(
                  future: getAllProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                    
                      return GridView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                             height: MediaQuery.of(context).size.height*1,
                              width: MediaQuery.of(context).size.height*1,
                               
                                 decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                                 ),
                         
                              child: GestureDetector(
                                 onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailView(data:snapshot.data.doc,) ));
                                },
                                child: Column(
                                  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Image.network(snapshot.data.docs[index]['url']),
                                      SizedBox(height: 5,),
                                        
                                    Text(snapshot.data.docs[index]['name'], style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                                    SizedBox(height: 5,width: 40,),
                                    Text(snapshot.data.docs[index]['price'], style: TextStyle(fontSize: 10,color: Colors.grey),),
                                  
                                  ],
                                ),
                              ),
                            
                          );
                        },
                        itemCount: snapshot.data.docs.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(  onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductView()),
                )
              },
      child: Icon(Icons.add),),
    );
  }
}
