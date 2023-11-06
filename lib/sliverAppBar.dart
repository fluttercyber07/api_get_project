import 'package:flutter/material.dart';

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            title: const Text('My App'),
            leading: const Icon(Icons.menu),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Flexible Space'),
              background: Image.asset(
                'assets/images/img.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => ListTile(
          //       title: Text('Item $index'),
          //     ),
          //   ),
          // ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                height: 200,
                margin: EdgeInsets.all(5),
                color: Colors.red[(index % 9 + 1) * 100],
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/img.png"),
                      height: 100,
                      width: 150,
                    ),
                    Text("${index + 1} - widget "),
                  ],
                ),
              );
            }, childCount: 14),
          ),

          //////
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.0,
            ),
          ),

          /////
          SliverToBoxAdapter(
            child: Container(
              color: Colors.yellow,
              padding: const EdgeInsets.all(8.0),
              child: Text('Grid Header', style: TextStyle(fontSize: 24)),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.0,
            ),
          ),


          ///////////////
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            children: <Widget>[
              Container(color: Colors.red),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.green),
              Container(color: Colors.blue),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ],
          ),

          ////////////////
          SliverGrid.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            children: <Widget>[
              Container(color: Colors.pink),
              Container(color: Colors.pink),
              Container(color: Colors.pink),
              Container(color: Colors.indigo),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
              Container(color: Colors.pink),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
//
// //////////////
// Scaffold(
// body: CustomScrollView(
// slivers: [
// SliverAppBar(
// floating: false,
// expandedHeight: 120.0,
// flexibleSpace: FlexibleSpaceBar(
// title: Text('SilverGrid AppBar'),
// ),
// ),
// SliverGrid(
// delegate: SliverChildBuilderDelegate(
// (context, index) {
// return Container(
// alignment: Alignment.center,
// color: Colors.teal[100 * (index % 9)],
// child: Text('grid item $index'),
// );
// },
// childCount: 10,
// ),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// mainAxisSpacing: 15,
// crossAxisSpacing: 15,
// childAspectRatio: 2.0,
// ),
// ),
// SliverToBoxAdapter(
// child: Container(
// color: Colors.yellow,
// padding: const EdgeInsets.all(8.0),
// child: Text('Grid Header', style: TextStyle(fontSize: 24)),
// ),
// ),
// SliverGrid.count(
// crossAxisCount: 3,
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
// childAspectRatio: 4.0,
// children: <Widget>[
// Container(color: Colors.red),
// Container(color: Colors.green),
// Container(color: Colors.blue),
// Container(color: Colors.red),
// Container(color: Colors.green),
// Container(color: Colors.blue),
// ],
// ),
// SliverGrid.extent(
// maxCrossAxisExtent: 200,
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
// childAspectRatio: 4.0,
// children: <Widget>[
// Container(color: Colors.pink),
// Container(color: Colors.indigo),
// Container(color: Colors.orange),
// Container(color: Colors.pink),
// Container(color: Colors.indigo),
// Container(color: Colors.orange),
// ],
// ),
// ],
// )
// );
