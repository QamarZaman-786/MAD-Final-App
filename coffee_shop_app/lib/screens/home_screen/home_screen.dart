import 'package:coffee_shop_app/config/colors.dart';
import 'package:coffee_shop_app/providers/product_provider.dart';
import 'package:coffee_shop_app/providers/user_provider.dart';
import 'package:coffee_shop_app/screens/home_screen/drawer_side.dart';
import 'package:coffee_shop_app/screens/home_screen/single_product.dart';
import 'package:coffee_shop_app/screens/product_overview/product_overview.dart';
import 'package:coffee_shop_app/screens/review_cart/review_cart.dart';
import 'package:coffee_shop_app/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider;

  Widget _buildPopularProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Popular Coffee'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getPopularProductDataList,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getPopularProductDataList.map(
                  (popularProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: popularProductData.productId,
                          productPrice: popularProductData.productPrice,
                          productName: popularProductData.productName,
                          productImage: popularProductData.productImage,
                        ),
                      ),
                    );
                  },
                  productId: popularProductData.productId,
                  productPrice: popularProductData.productPrice,
                  productImage: popularProductData.productImage,
                  productName: popularProductData.productName,
                  productUnit:popularProductData ,
                );
              },
            ).toList(),
            // children: [

            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New Flavours'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getNewProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getNewProductDataList.map(
                  (newProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: newProductData.productId,
                          productImage: newProductData.productImage,
                          productName: newProductData.productName,
                          productPrice: newProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productId: newProductData.productId,
                  productImage: newProductData.productImage,
                  productName: newProductData.productName,
                  productPrice: newProductData.productPrice,
                  productUnit:newProductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }


  Widget _buildRootProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Coffee Beans'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getRootProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getRootProductDataList.map(
                  (rootProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: rootProductData.productId,
                          productImage: rootProductData.productImage,
                          productName: rootProductData.productName,
                          productPrice: rootProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productId: rootProductData.productId,
                  productImage: rootProductData.productImage,
                  productName: rootProductData.productName,
                  productPrice: rootProductData.productPrice,
                  productUnit: rootProductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }



  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fetchPopularProductData();
    initproductProvider.fetchNewProductData();
    initproductProvider.fetchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider.getAllProductSearch),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Color(0xffd6d382),
                radius: 15,
                child: Icon(
                  Icons.shop,
                  size: 17,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/coffee-banner-design-template-a99fd7f9a0bfefc1610885df45bf1024_screen.jpg?ts=1589994279'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Coffee',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '10% Off',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'On our New Flavours',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildPopularProduct(context),
            _buildNewProduct(context),
            _buildRootProduct(),
          ],
        ),
      ),
    );
  }
}