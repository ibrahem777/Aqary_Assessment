import 'package:flutter/material.dart';

class BouncingListPage extends StatefulWidget {
  const BouncingListPage({Key? key}) : super(key: key);

  @override
  _BouncingListPageState createState() => _BouncingListPageState();
}

class _BouncingListPageState extends State<BouncingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bouncing List'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _StickyHeaderDelegate(

              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Heading',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SliverList.builder(itemBuilder: (BuildContext context, int index)=>Text('item # $index'),)
        ],
      )
    );
  }
}
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  double get minExtent => 0;

  @override
  double get maxExtent => 100; // Adjust this value according to your needs

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}