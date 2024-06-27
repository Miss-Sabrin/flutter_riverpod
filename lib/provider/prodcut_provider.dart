import 'package:reverpod_state/model/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//part 'products_provider.g.dart';
 part 'prodcut_provider.g.dart';

const List<Products> allOroducts=[
  Products(id: '1', title: 'shorts', price: 12, image: 'images/short.webp'),
  Products(id: '2', title: 'bati', price: 12, image: 'images/short.webp'),
  Products(id: '3', title: 'surwal', price: 12, image: 'images/short.webp'),
  Products(id: '4', title: 'karan', price: 12, image: 'images/short.webp'),
  Products(id: '5', title: 'kastuma', price: 12, image: 'images/short.webp'),
  Products(id: '6', title: 'buma', price: 12, image: 'images/short.webp'),
  Products(id: '7', title: 'macwis', price: 12, image: 'images/short.webp'),
  Products(id: '8', title: 'macwis', price: 12, image: 'images/short.webp'),

];



//generated providers
@riverpod 
List<Products>products(ref){
  return allOroducts;
}

@riverpod
List<Products>reducedProduct(ref){
  return allOroducts.where((p)=>p.price <50).toList();
}