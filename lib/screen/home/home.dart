import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_state/provider/cart_provider.dart';
import 'package:reverpod_state/provider/prodcut_provider.dart';
import 'package:reverpod_state/widgets/cart_icon.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final allProducts=ref.watch(productsProvider);
    final cartProduct=ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('come to sell 😁'),
        actions: [CartIcon()],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          childAspectRatio: 0.9,
          mainAxisSpacing: 20
        ),
        itemCount: allProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(20),
            color: Colors.blueGrey.withOpacity(0.05),
            child: Column(
              children: [
                Image.asset(allProducts[index].image,width: 100,height: 60,),
                Text(allProducts[index].title),
                Text('${allProducts[index].price}'),

                //
                if(cartProduct.contains(allProducts[index]))
                TextButton(
                  onPressed: (){
                     ref.read(cartNotifierProvider.notifier)
                    .removeProduct(allProducts[index]);
                  },
                   child: Text('Remove')),

                    if(!cartProduct.contains(allProducts[index]))
                TextButton(
                  onPressed: (){
                    ref.read(cartNotifierProvider.notifier)
                    .addProduct(allProducts[index]);
                  },
                   child: Text('add')),



              ],
            ),
          );
        },
      ),),
    );
  }
}