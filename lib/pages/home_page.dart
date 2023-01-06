// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/productlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    var data = jsonDecode(catalogJson);
    var productsData = data["products"];
    try {
      CatalogModel.products = List.from(productsData)
          .map<Item>(
            (item) => Item.fromMap(item),
          )
          .toList();
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'E-Commerce',
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModel.products.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        item: CatalogModel.products[index],
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
