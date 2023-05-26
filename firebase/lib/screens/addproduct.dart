import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'allproducts.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  addProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products
        .add({"name": productName.text, "price": productPrice.text})
        .then((value) => print("Product Addes"))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: productName,
              decoration: InputDecoration(
                  fillColor: Colors.white30,
                  filled: true,
                  hintText: "Product Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: productPrice,
              decoration: InputDecoration(
                  fillColor: Colors.white30,
                  filled: true,
                  hintText: "Product Price",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                addProduct();
                Navigator.pop(context);
              },
              child: const Text("Add Product"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllProductsView()),
                )
              },
              child: const Text("All Product"),
            ),
          ],
        ),
      ),
    );
  }
}
