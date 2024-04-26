import 'package:flutter/material.dart';

Widget defaultTextField({
  required String label,
  required TextInputType type,
  required TextEditingController controller,
  required IconData prefix,
  required FormFieldValidator validate,
  IconData? suffix,
  double radius = 10.0,
  bool obscureText = false,
  Function? suffixPressed,
  Function? onTapUp,
  Function? onChange,
  Function? onSubmitted,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: (s) {
        onSubmitted!(s);
      },
      // onChanged: onChange!('s'),
      // onTap: () {
      //   onTapUp!();
      // },
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[400],
        ),
        floatingLabelStyle: const TextStyle(
          color: Color(0xff00BCD4),
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey[300],
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  {
                    suffixPressed!();
                  }
                },
                icon: Icon(
                  suffix,
                  color: Colors.grey[300],
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Color(0xff00BCD4),
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Color(0xff00BCD4),
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Color(0xff00BCD4),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),

      validator: validate,
    );
