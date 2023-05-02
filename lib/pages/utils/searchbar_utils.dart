import 'package:flutter/material.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 200,
          child: TextFormField(
            decoration: fieldDecoration(
              context,
              placeHolder,
              '',
              suffixIcon: IconButton(
                onPressed: () {
                  onSearchTap(val);
                },
                icon: const Icon(Icons.web),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
          width: 150.0,
          child: GestureDetector(
            onTap: () {
              onSearchTap(val);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      addButtonLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

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
}
