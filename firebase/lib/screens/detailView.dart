import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailView extends StatelessWidget {
  var data;

   DetailView({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: GridView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                       height: MediaQuery.of(context).size.height*1,
                        width: MediaQuery.of(context).size.height*1,
                         
                           decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                           ),
                   
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Image.network(data['url']),
                                
                            Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            SizedBox(height: 5,width: 40,),
                            Text(data['price'], style: TextStyle(fontSize: 10,color: Colors.grey),),
                          
                          ],
                        ),
                      
                    );
                  },
                  itemCount: 1,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                )
        ),
      ),
    );
  }
}
