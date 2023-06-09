import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addproduct.dart';
import 'detailView.dart';

class AllProductsView extends StatelessWidget {
  AllProductsView({super.key});
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");
  CollectionReference UserDetails =
      FirebaseFirestore.instance.collection("userDetails");

  getAllProducts() async {
    return products.get();
  }

  getUserDetail() async {
    return UserDetails.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: const Text(
          'E-Commerce',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black87,
          ),
          IconButton(
            onPressed: () {
              getUserDetail();
              
            },
            icon: const Icon(Icons.local_grocery_store),
            color: Colors.black87,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(radius: 13,
              backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/project1-d01fb.appspot.com/o/profile.jpg?alt=media&token=e857e1e6-236c-4a85-9d1b-f6f8ad4b3897"),),
          ),
          SizedBox(width: 1,)
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: SizedBox(
                      width: 350,
                      height: 80,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey,
                            hintText: 'Search Here',
                            prefixIcon: Icon(Icons.search),
                            iconColor: Colors.grey),
                      ),
                    )),
              ),
              const SingleChildScrollView(),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'see all',
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.food_bank),
                        ),
                        const Text(
                          'Foods',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.phone_iphone),
                        ),
                        const Text(
                          'Mobiles',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.local_grocery_store),
                        ),
                        const Text(
                          'cloths',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.watch_outlined),
                        ),
                        const Text(
                          'Watches',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Featured Products',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'see all',
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              ),
              FutureBuilder(
                  future: getAllProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              child: Stack(
                                children: [
                                  Container(
                                      width: 250,
                                      height: 300,
                                      child: Card(
                                          elevation: 10,
                                          child: Container(
                                            width: 250,
                                            height: 220,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailView(
                                                            data: snapshot.data
                                                                .docs[index]),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    snapshot.data.docs[index]
                                                        ['url'],
                                                    height: 120,
                                                    width: 200,
                                                  ),
                                                  Text(
                                                      snapshot.data.docs[index]
                                                          ['name'],
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black87)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['price'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .grey)),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text("Rs",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey)),
                                                      const SizedBox(
                                                        width: 100,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            Icon(
                                                                Icons.bookmark);
                                                          },
                                                          child: const Icon(Icons
                                                              .bookmark_border))
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )))
                                ],
                              ),
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.grey[700],
        child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProductView(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black87,
            )),
      ),
    );
  }
}
