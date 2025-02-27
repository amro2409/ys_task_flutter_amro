import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget{
  const MainButtonWidget({super.key,this.onTap1, this.title,this.icon,this.color});
  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap1;
  final IconData? icon;
  final String? title;
  final MaterialColor? color;

  _boxDecoration(myColor ){
    return   BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(1.0, 1.0),
              spreadRadius: 5.0,
              blurRadius: 5.0)
        ],
        color: myColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)));
  }

  @override
  Widget build(BuildContext context) {

    checkTitle ()=>Text(title ?? "Title",textAlign: TextAlign.center,textWidthBasis:TextWidthBasis.parent,
      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16,letterSpacing: 1.0,
          decoration: TextDecoration.none),);
    checkIcon  ()=>Icon(icon??Icons.add,color: Colors.white,size: 45,);
    checkColor ()=>color??Colors.primaries[3];

    return  Material(
      borderRadius: BorderRadius.circular(15) ,
      color: checkColor().withAlpha(90).withOpacity(0.8),
      child: InkWell(
        onTap: onTap1,
        borderRadius: BorderRadius.circular(15.0),
        highlightColor: Colors.cyanAccent.withOpacity(0.5),
        splashColor: Colors.blueAccent.withOpacity(0.5),
        child: Container(
            alignment: Alignment.center,
          //decoration: _boxDecoration(checkColor()),
          padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              checkIcon(),
              //const Spacer(),
              const SizedBox(
                height: 15,
              ),
              checkTitle(),
            ],
          )
        ),

      ),
    );


  }



}