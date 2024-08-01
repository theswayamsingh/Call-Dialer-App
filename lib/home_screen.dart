import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<List<String>> data = [
    ['Akash', '+91 98345 638783', 'r', '02:45 PM', 'p1'],
    ['Sankar', '+91 80463 76786', 'r', '02:45 PM', 'p2'],
    ['John', '+91 73684 89078', 'r', '02:45 PM', 'p3'],
    ['Kamatchi', '+91 90537 46635', 'r', '02:40 PM', 'p4'],
    ['Robert', '+91 80547 53625', '0', '01:27 PM', 'p5'],
    ['Niyas', '+91 90436 54334', 'r', '01:06 PM', 'p6'],
    ['Alex', '+91 91767 65774', 'r', '12:55 PM', 'p7'],
  ];

  String title = 'Today';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Builder(
          builder: (context) {
            return const Drawer(    // appbar: is must
              // Content
            );
          }
        ),
        appBar: AppBar(),
        body: Stack(
          children: [
              Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: screenWidth*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Calls',
                          style: TextStyle(
                            fontSize: screenHeight*.033
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            setState(() {
                              title='Search';
                            });
                          },
                          icon: Icon(Icons.search, size: screenHeight*.036,),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight*.008),
                  child: Container(
                    height: 3,
                    width: screenWidth*.9,
                    color: const Color.fromARGB(255, 205, 205, 205),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight*.008),
                  child: Container(
                    height: screenHeight*.03,
                    width: screenWidth*.17,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8)
                      )
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: screenHeight*.022,
                          fontWeight: FontWeight.w500 
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight*.56,
                  width: screenWidth,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => 
                      ListTile(
                        leading: SizedBox(
                          width: screenWidth*.2,
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: screenHeight*.033,
                                    ),
                                    Image.asset(
                                    'assets/${data[index][4]}.png',
                                    width: screenWidth*.13,
                                  ),
                                  ],
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.online_prediction, color: Colors.green,),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index][0],
                                  style: TextStyle(
                                    fontSize: screenHeight*.022,
                                  ),
                                ),
                                Text(
                                  data[index][1],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenHeight*.018
                                  ),
                                )
                              ],
                            ),
                            data[index][2]=='r'? const Icon(Icons.call_received_rounded, color: Colors.green,): const Icon(Icons.call_missed_outgoing_rounded, color: Colors.red,)
                          ],
                        ),
                        trailing: Text(
                          data[index][3],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenHeight*.016
                          ),
                        ),
                      ),
                    ),
                ),
                Container(
                  height: screenHeight*.2,
                  width: screenWidth*.9,
                  decoration: const BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(200), topRight: Radius.circular(200)),
                    color: Color.fromARGB(255, 233, 233, 233)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: screenHeight*.13,),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                title='Chats';
                              });
                            },
                            icon: Icon(
                              Icons.message,
                              size: screenHeight*.04,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: (){
                              setState(() {
                                title='Home';
                              });
                            },
                            icon: Icon(
                              Icons.home,
                              size: screenHeight*.04,
                            ),
                          ),
                          Container(
                            height: screenHeight*.06,
                            width: screenWidth*.25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                              color: Colors.black
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: screenHeight*.13,),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                title = 'Calls';
                              });
                            },
                            icon: Icon(
                              Icons.call,
                              size: screenHeight*.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight*.63, right: screenWidth*.05),
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        title='Dial';
                      });
                    },
                    icon: Icon(Icons.dialpad, size: screenWidth*.15,),
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}