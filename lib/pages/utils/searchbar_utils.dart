// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SearchBarUtils {
  static Widget searchBar(
      BuildContext context,
      String keyName,
      String placeHolder,
      String addButtonLabel,
      Function onSearchTap,
      Function onAddButtnTap) {
    String val = "";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 160,
          child: FormHelper.inputFieldWidget(
            context,
            keyName,
            placeHolder,
            () {},
            () {},
            onChange: (onChangeVal) => {val = onChangeVal},
            showPrefixIcon: false,
            suffixIcon: SizedBox(
              child: GestureDetector(
                child: const Icon(Icons.search),
                onTap: () {
                  //return onSearchTap();
                  onSearchTap(val);
                },
              ),
            ),
            borderFocusColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            paddingLeft: 0,
          ),
        ),
        FormHelper.submitButton(
          addButtonLabel,
          () {
            return onAddButtnTap();
          },
          borderRadius: 10,
          width: 130,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
/*
  static InputDecoration fieldDecoration(
    BuildContext context,
    String hintText,
    String helperText, {
    prefixIcon,
    suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(6),
      hintText: hintText,
      helperText: helperText,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
  */
}
