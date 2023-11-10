import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grace/models/book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<QuerySnapshot> _books;

  final double _spacing = 12.0;
  final num _breakpoint = 392;

  @override
  void initState() {
    super.initState();

    _books = FirebaseFirestore.instance
        .collection('books')
        .orderBy('title')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Grace'))),
        body: StreamBuilder<QuerySnapshot>(
            stream: _books,
            builder: (context, snapshot) {
              return switch (snapshot) {
                AsyncSnapshot(hasError: true) =>
                  Center(child: Text('Error: ${snapshot.error}')),
                AsyncSnapshot(hasData: false) =>
                  const Center(child: Text('Loading...')),
                _ => GridView.count(
                    crossAxisCount:
                        (MediaQuery.of(context).size.width ~/ _breakpoint)
                            .toInt(),
                    crossAxisSpacing: _spacing,
                    mainAxisSpacing: _spacing,
                    padding: EdgeInsetsDirectional.all(_spacing),
                    children:
                        List.generate(snapshot.data!.docs.length, (index) {
                      Book book = Book.fromJson(snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>);

                      return Card(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                Flexible(
                                  child: FractionallySizedBox(
                                      alignment: Alignment.topCenter,
                                      heightFactor: 0.9,
                                      child: Image.network(
                                          'https://covers.openlibrary.org/b/isbn/${book.isbn}-L.jpg',
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                    padding: EdgeInsets.all(_spacing * 2),
                                    child: Column(children: [
                                      Text(book.title,
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      Text('by ${book.author}',
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal)),
                                      Text('Published ${book.publicationDate}',
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal)),
                                    ])),
                              ])));
                    }))
              };
            }));
  }
}
