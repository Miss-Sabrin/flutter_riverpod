import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_state/provider/cart_provider.dart';
import 'package:reverpod_state/screen/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context ,WidgetRef  ref) {
    final numberOfItemsInCart=ref.watch(cartNotifierProvider).length;
    return Stack(
      children: [
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
           icon: Icon(Icons.shopping_bag_outlined)),

           Positioned(
            top: 5,
            left: 5,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)

              ),
              child:  Center(child: Text(numberOfItemsInCart.toString(),style: TextStyle(color: Colors.white),))

           ))
      ],
    );
  }
}