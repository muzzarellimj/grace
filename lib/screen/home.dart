import 'package:flutter/material.dart';
import 'package:grace/model/material/material.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/service/material_service.dart';
import 'package:grace/utility/theme.dart';
import 'package:grace/widget/collection/collection.dart';
import 'package:grace/widget/search/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: ThemeUtility.calculateSpacing(3.5),
            bottom: ThemeUtility.calculateSpacing(3.5),
            left: ThemeUtility.calculateSpacing(3.0),
            right: ThemeUtility.calculateSpacing(3.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: ThemeUtility.calculateSpacing(2.0),
                ),
                child: Text(
                  'Welcome back to Grace, Dr. Cho',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: ThemeUtility.calculateSpacing(2.0),
                ),
                child: const Search(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: ThemeUtility.calculateSpacing(2.0),
                ),
                child: getFutureBuilder(
                  MaterialService(material: MaterialDescriptor.book),
                  'Recently added books',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: ThemeUtility.calculateSpacing(2.0),
                ),
                child: getFutureBuilder(
                  MaterialService(material: MaterialDescriptor.game),
                  'Recently added games',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: ThemeUtility.calculateSpacing(2.0),
                ),
                child: getFutureBuilder(
                  MaterialService(material: MaterialDescriptor.movie),
                  'Recently added movies',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List> getFutureBuilder(
      MaterialService service, String headline) {
    return FutureBuilder(
      future: load(service),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        } else {
          if (snapshot.hasError) {
            return const Text('Oops! We hit a snag. Please try again.');
          } else {
            return Collection(headline: headline, materials: snapshot.data);
          }
        }
      },
    );
  }

  Future<List<Object>> load(MaterialService service) async {
    List<Object> list = List.empty(growable: true);

    for (int i = 1; i <= 5; i++) {
      GetMaterialResponse response = await service.fetch(i);

      if (response.status == ResponseStatus.success) {
        list.add(response.material);
      }
    }

    return list;
  }
}
