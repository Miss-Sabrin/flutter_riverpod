import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_state/provider/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupn=true;
  @override
  Widget build(BuildContext context) {
    final cartProducts= ref.watch(cartNotifierProvider);
    final total=ref.watch(cartTotalProvider);
    return  Scaffold(
      appBar: AppBar(title: Center(child: Text('your cart 😊')),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: 
                cartProducts.map((product){
                  return Container(
                    padding: EdgeInsets.only(bottom: 10,top: 10),
                    child: Row(
                      children: [
                        Image.asset(product.image,width: 60,height: 60,),
                        const SizedBox(width: 10,),
                        Text(product.title),
                        Expanded(child: SizedBox()),
                        Text('${product.price}')

                      ],
                    ),

                  );

                }).toList(), //output cart products here 
              
            ),
            Text('Total Price - $total')

          ],
        ),
      ),
    );
  }
}