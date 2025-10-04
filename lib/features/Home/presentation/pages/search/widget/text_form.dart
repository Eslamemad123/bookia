import 'package:bookia/core/extentions/debouncer%20.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextForm extends StatefulWidget {
  TextForm({super.key, required this.cubit});
  final Home_Cubit cubit;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {

  final Debouncer _debouncer = Debouncer(milliseconds: 700);

  @override
  void initState() {
    super.initState();
    widget.cubit.searchTitle.addListener(() {
      // Debounce the search query
      _debouncer.run(
        () => context.read<Home_Cubit>().getSearchData(widget.cubit.searchTitle.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search Of Book',
          hintStyle: TextStyle(color: App_Color.textgreyForm),
          prefixIcon: Icon(Icons.search, color: App_Color.textgreydark),
          filled: true,
          fillColor:
              App_Color.borderFormFiled, // background color for text field
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), // rounded corners
            borderSide: BorderSide.none,
            // no border
          ),
        ),
        controller: widget.cubit.searchTitle,
        onChanged: (value) {
          _debouncer.run(() {
            widget.cubit.getSearchData(value);
          });
        },
      ),
    );
  }
}
