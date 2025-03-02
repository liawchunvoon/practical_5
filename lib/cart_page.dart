// TODO: STEP 11
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart'),
      ),
      body: Center(
        child: CartListWidget(),
      ),
    );
  }
}

class CartListWidget extends StatefulWidget {
  const CartListWidget({super.key});
  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: (E) Consumer > ListView.separated & Text
    return Consumer<CartProvider>(builder: (context, cart, child) =>
      cart.itemList.isNotEmpty ?
        ListView.separated(
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) => CartItem(index: index, item: cart.itemList[index]),
          separatorBuilder: (context, index) => Divider(),
          itemCount: cart.itemList.length,
        ) :
        Text('Cart is empty'),
    );
  }
}

class CartItem extends StatelessWidget {
  final int index;
  final Item item;
  const CartItem({super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: (F) Text + Expanded + TextButton
        Text('$item'),
        Expanded(child: SizedBox()),
        TextButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).remove(item);
          },
          child: Text('Remove'),
        ),
      ],
    );
  }
}
