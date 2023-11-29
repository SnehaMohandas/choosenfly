import 'package:flutter/material.dart';

class PDetail extends StatelessWidget {
  const PDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Center(
                              child: Text(
                            'Go Back',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Image.network(
                      'https://cdn.shopify.com/s/files/1/0079/6229/6400/products/bcaa-250g_grande.png?v=1550448494',
                      height: 250,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("All Stars BCAA Powder 500g Lemon Ice Tea "),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50, bottom: 10),
                          child: Text(
                            'Quantity',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '19.00 KD',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Discount packs',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepOrangeAccent),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text('3 unit'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text('5 unit'),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text('10 unit '),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Product values',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepOrangeAccent),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                          ),
                          child: Column(
                            children: [
                              Container(
                                transform: Matrix4.skewX(-.2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                height: 50,
                                width: 70,
                                child: Center(
                                  child: Icon(Icons.leak_add),
                                ),
                              ),
                              Text('data')
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
