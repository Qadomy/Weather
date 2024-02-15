import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: TextField(
        controller: searchController,
        onEditingComplete: () => _searchTap(context),
        cursorColor: ColorsManager.darkBlue,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintMaxLines: 1,
          hintText: "Search",
          hintStyle: TextStyles.font16BlackBold.copyWith(
            color: ColorsManager.gray,
          ),
          suffixIconColor: ColorsManager.gray,
          fillColor: ColorsManager.lightGray,
          filled: true,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.h),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Container(
            margin: EdgeInsets.all(6.h),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(6.h),
            ),
            child: GestureDetector(
                onTap: () => _searchTap(context),
                child: const Icon(Icons.search)),
          ),
        ),
      ),
    );
  }

  void _searchTap(BuildContext context) {
    if (searchController.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        Routes.detailsView,
        arguments: ScreenArguments(cityName: searchController.text),
      );
      searchController.clear();
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).unfocus();
    }
  }
}
