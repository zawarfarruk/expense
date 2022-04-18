
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChartBar extends StatelessWidget {
  // const ChartBar({ Key? key }) : super(key: key);
String label;
final double spendingAmount;
final double spendingPctOfTotal;
ChartBar(this.label,this.spendingAmount,this.spendingPctOfTotal, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
        SizedBox(height: 8,),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border:Border.all(color: Colors.grey,width: 1) ,
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(8),
                ),
            ),
            FractionallySizedBox(heightFactor: spendingPctOfTotal,child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
              ),
            
            ),)
          ],),
        ),
        SizedBox(
          height: 8),
          Text(label),
      ],
      
    );
  }
}