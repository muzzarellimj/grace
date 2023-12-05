import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grace/models/book.dart';
import 'package:grace/services/queries/impl/recent_query_strategy.dart';
import 'package:grace/services/queries/query_strategy.dart';
import 'package:grace/widgets/collections/resource.dart';

const double basePadding = 24.0;
const double breakpoint = 392.0;
const backgroundColor = Color.fromRGBO(245, 243, 240, 1.0);

class CollectionSnapshot extends StatefulWidget {
  final String collection;
  final QueryStrategy? strategy;

  const CollectionSnapshot({
    super.key,
    required this.collection,
    this.strategy,
  });

  @override
  State<StatefulWidget> createState() => _CollectionSnapshotState();
}

class _CollectionSnapshotState extends State<CollectionSnapshot> {
  late Stream<QuerySnapshot> _snapshot;

  @override
  void initState() {
    super.initState();

    var strategy = widget.strategy ?? RandomQueryStrategy();

    _snapshot = strategy.resolve(widget.collection);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(basePadding),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: basePadding),
              child: Text(
                'Most recent books',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            StreamBuilder(
              stream: _snapshot,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return switch (snapshot) {
                  AsyncSnapshot(hasError: true) =>
                    const Center(child: Text('Error')),
                  AsyncSnapshot(hasData: false) =>
                    const Center(child: Text('Loading')),
                  _ => GridView.count(
                      crossAxisCount:
                          MediaQuery.of(context).size.width ~/ breakpoint,
                      shrinkWrap: true,
                      mainAxisSpacing: basePadding / 2,
                      crossAxisSpacing: basePadding / 2,
                      childAspectRatio: 1.5,
                      children: List<Widget>.generate(
                        snapshot.data?.docs.length,
                        (index) {
                          Book book =
                              Book.fromJson(snapshot.data?.docs[index]?.data());

                          return Resource(book: book);
                        },
                      ),
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
