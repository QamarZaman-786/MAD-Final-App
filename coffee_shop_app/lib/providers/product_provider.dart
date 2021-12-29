import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  ProductModel productModel;

  get search => null;

  //List<ProductProvider>search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productUnit: element.get("productUnit"),
      productQuantity: element.get("productQuantity"),
    );
    search.add(productModel);
  }



/////////////Popular Product///////////
  List<ProductModel> popularProductList = [];

  fetchPopularProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("PopularProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    popularProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getPopularProductDataList {
    return popularProductList;
  }

  /////////New Product////////////////

  List<ProductModel> newProductList = [];

  fetchNewProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("NewProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    newProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getNewProductDataList {
    return newProductList;
  }

//////////Root Product///////////////////////

  List<ProductModel> rootProductList = [];

  fetchRootProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("RootProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    rootProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  /////////////Search Return///////////////

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}