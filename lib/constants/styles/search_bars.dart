import 'package:flutter/material.dart';
import 'package:jumush/constants/styles/app_colors.dart';

searchbar(hintText) {
  return Flexible(
    child: TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search, color: appColor),
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: appColorLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      ),
    ),
  );
}