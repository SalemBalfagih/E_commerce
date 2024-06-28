import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
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
                color: AppColor.primaryColor, spreadRadius: 2, blurRadius: 3)
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              color: AppColor.secondaryColor,
            ),
            Expanded(
              child: TextFormField(
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
    );
  }
}
