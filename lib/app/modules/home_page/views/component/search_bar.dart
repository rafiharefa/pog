import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 650,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FormBuilder(
              child: FormBuilderTextField(name: 'search',
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: ' Search',
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search)
                  )
              )
          ),
        )
    );
  }
}
