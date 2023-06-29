import 'package:flutter/material.dart';

class CommonSearchBar extends StatefulWidget {
  const CommonSearchBar({super.key, this.formValidator, this.onChange});

  final String? Function(String?)? formValidator;
  final void Function(String?)? onChange;

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        validator: widget.formValidator,
        onChanged: widget.onChange,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintText: 'Search',
        ),
      ),
    );
  }
}
