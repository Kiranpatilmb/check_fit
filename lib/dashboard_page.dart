import 'package:check_fit/health_page.dart';
import 'package:check_fit/heart_rate_page.dart';
import 'package:check_fit/height_page.dart';
import 'package:check_fit/sleep_page.dart';
import 'package:check_fit/weight_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
   DashboardPage({super.key});
List<String> list =["Steps","Sleep","Heart Rate","Weight","Height"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         body: Center(
        child:GridView.count(
        crossAxisCount: 2,
        children:List.generate(5, (index) {
      return Center(
          child:  InkWell(
          onTap: (){
            if(index==0) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  HomePage()));
            }else  if(index==1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  SleepPage()));
            }else  if(index==2) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  HeartRatePage()));
            }else  if(index==3) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  WeightPage()));
            }else  if(index==4) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  HeightPage()));
            }
          },
          child:Container(
            margin: EdgeInsets.all(20),
          width: 150,height: 150,
              child:Card(
          color: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.all(5),
          child: Center(
            child: Text(list[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
          ),)))
      );})
      )

         ));
  }
}
