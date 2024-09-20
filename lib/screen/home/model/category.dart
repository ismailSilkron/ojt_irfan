import 'package:flutter/material.dart';
import 'package:ojt_irfan/config/theme/app_pallete.dart';
import 'package:ojt_irfan/utils/constant/image_asset.dart';

class Category {
  final String name;
  final String icon;
  final Color bgColor;

  Category({
    required this.name,
    required this.icon,
    required this.bgColor,
  });

  @override
  String toString() {
    return "Category{ name: $name, icon: $icon, bgColor: $bgColor }";
  }

  static List<Category> getCategoryList() {
    List<Category> categoryList = [];

    categoryList.add(
      Category(
        name: "Salad",
        icon: ImageAsset.common.plateIcon,
        bgColor: AppPallete.blueColor,
      ),
    );

    categoryList.add(
      Category(
        name: "Cake",
        icon: ImageAsset.common.bluePancakeIcon,
        bgColor: AppPallete.pinkColor,
      ),
    );

    return categoryList;
  }
}
