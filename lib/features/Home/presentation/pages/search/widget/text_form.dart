import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.cubit,
  });

  final Home_Cubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search Of Book',
          hintStyle: TextStyle(
            color: App_Color.textgreyForm,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: App_Color.textgreydark,
          ),
          filled: true,
          fillColor:
              App_Color
                  .borderFormFiled, // background color for text field
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ), // rounded corners
            borderSide: BorderSide.none,
            // no border
          ),
        ),
        controller: cubit.searchTitle,
        onChanged: (value) {
          cubit.getSearchData(value);
        },
      ),
    );
  }
}
