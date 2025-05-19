import 'package:flutter/material.dart';

class CusttomTextFormField extends StatelessWidget {
  const CusttomTextFormField({super.key,this.label,this.hint,this.iconDataSuffix,this.iconDataPrefix,this.controller,this.validator,this.onChanged,this.obscureText});
final String? label;
final String? hint;

final String? Function(String?)? validator;
final IconData? iconDataSuffix;
final IconData? iconDataPrefix;
final void Function(String)? onChanged;
final TextEditingController? controller;
final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
        onChanged:onChanged ,
        validator: validator,
      controller:controller ,
      decoration:  InputDecoration(

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 2),
        ),
        labelText:label,
        hintText: hint,
        prefixIcon: Icon(iconDataPrefix),
        suffixIcon: Icon(iconDataSuffix),


      ));
  }
}
