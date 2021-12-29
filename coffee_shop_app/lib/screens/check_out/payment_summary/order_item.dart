
import 'package:coffee_shop_app/models/review_cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  OrderItem({this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            e.cartUnit,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "Rs${e.cartPrice}",

          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    );
  }
}