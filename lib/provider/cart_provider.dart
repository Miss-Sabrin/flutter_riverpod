import 'package:reverpod_state/model/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "cart_provider.g.dart";

@riverpod

class CartNotifier extends _$CartNotifier{
  ///inita value

  @override
 Set<Products> build(){
  return const {


  };
 }
 ///methos to update
 
 void addProduct(Products product){
  if(!state.contains(product)){
    state={...state,product};
  }
 }
 //
  void removeProduct(Products product){
  if(state.contains(product)){
    state=state.where((p)=>p.id!= product.id).toSet();
  }
 }
 //
 

 

 
}




@riverpod
int cartTotal(ref){
  final cartProduct=ref.watch(cartNotifierProvider);
  int total =0;
  for(Products product in cartProduct){
    total+=product.price;
  }
  return total;
  
}
