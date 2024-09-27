import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final TextInputType? textInputType;
  const SearchBarWidget({
    super.key,
    this.onChanged,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 4,
      child: TextField(
        keyboardType: textInputType ?? TextInputType.phone,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Buscar',
          hintStyle: const TextStyle(color: Color(0xff7C7C7C)),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: const Color(0xffF6F6F6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none, // Remove a borda
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
