

import 'package:flutter/material.dart';

import '../colors.dart';

class BulletsWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: MyColor.bulletsColor,
          ),
        ),
        SizedBox(width: 4,),


      ],


    )
    ;


  }
}

