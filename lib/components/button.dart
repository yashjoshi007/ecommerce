
import 'package:ecommerce/components/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyButton extends StatelessWidget {


  final String text;
  final VoidCallback onPressed;


  const MyButton({super.key,required this.text, required this.onPressed}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32, 14, 32, 14),
      child: Container(
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            child: MaterialButton(
              padding: EdgeInsets.fromLTRB(28, 14, 28, 14),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: onPressed ,
              child: Text(text,style: MyTheme().textTheme.bodyText1
                  ?.copyWith(fontWeight: FontWeight.w500, color: MyTheme().colorScheme.onPrimary)),
            ),
          )
      ),
    );
  }
}





