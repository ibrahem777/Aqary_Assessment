import 'dart:math';

import 'package:easy_sticky_header/easy_sticky_header.dart';
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
      body: StickyHeader(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
        if (index % 3 == 0) {
          return StickyContainerWidget(
            index: index,
            child: Container(
              color: Color.fromRGBO(Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256), 1),
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              child: Text(
                'Header #$index',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
        // Custom item widget.
        return Container(
          width: double.infinity,
          height: 80,
          color: Colors.white,
          child: Text(
            'item #$index',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
          ),
        );
      }),

      )
      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       automaticallyImplyLeading: false,
      //       backgroundColor: Colors.redAccent,
      //
      //       title: const Text('Header'),
      //       centerTitle: true,
      //       pinned: true,
      //     ),
      //     SliverPersistentHeader(
      //       pinned: true,
      //       floating: true,
      //
      //       delegate: _StickyHeaderDelegate(
      //
      //         child: Container(
      //           alignment: Alignment.center,
      //           color: Colors.blue,
      //           padding: const EdgeInsets.all(20),
      //           child: const Text(
      //             'Heading',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ),
      //     SliverList.builder(itemCount: 10, itemBuilder: (BuildContext context, int index)=>Text('item # $index'),),
      //     SliverPersistentHeader(
      //       pinned: true,
      //       floating: true,
      //
      //       delegate: _StickyHeaderDelegate(
      //
      //         child: Container(
      //           alignment: Alignment.center,
      //           color: Colors.blue,
      //           padding: const EdgeInsets.all(20),
      //           child: const Text(
      //             'Heading',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ),
      //     SliverList.builder(itemCount: 100, itemBuilder: (BuildContext context, int index)=>Text('item # $index'),),
      //
      //   ],
      // )
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