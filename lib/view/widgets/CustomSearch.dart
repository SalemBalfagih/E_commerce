import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(seconds: 1),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.primaryColor,
                    spreadRadius: 2,
                    blurRadius: 3,
                  ),
                ],
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    color: AppColor.secondaryColor,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        // Call search function on each keystroke
                        _searchProducts(value);
                      },
                      style: const TextStyle(
                        color: AppColor.secondaryColor,
                        fontFamily: "BebasNeue",
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search your products",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 143, 142, 142),
                          fontFamily: "BebasNeue",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _searchProducts(String query) {
    ProductController productController = Get.find<ProductController>();
    productController.searchProducts(query);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
