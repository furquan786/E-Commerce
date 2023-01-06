import 'package:e_commerce/models/catalog.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Item item;
  const ProductWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("Rs. ${item.price}"),
      ),
    );
  }
}
