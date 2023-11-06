import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            // AppBar ning balandligi
            flexibleSpace: FlexibleSpaceBar(
              // appBarning kengaygandagi oraqa background di
              background: Stack(
                children: [
                  Image.asset(
                    'assets/images/img.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,bottom: 16),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 1.0, end: 0.0),
                        duration: const Duration(milliseconds: 1500),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.scale(
                            scale: 1 + value,
                            child: Opacity(
                              opacity: 1 - value,
                              child: const Text(
                                "Parallax Header",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.lime,
            pinned: false,
            floating: true,
            title: const Text("Sticky Headers"),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(6),
              color: Colors.yellow[(index % 9 + 1) * 100],
              height: 10 * (index % 10 + 1) + 30,
            );
          }, childCount: 20))
        ],
      ),
    );
  }
}
