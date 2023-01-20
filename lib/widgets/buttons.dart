import 'package:flutter/material.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import '../constants/colors.dart';
import '../constants/constans.dart';
import '../constants/image_urls.dart';


class RoundEdgedButton extends StatelessWidget {
  final Color color;
  final Color bordercolor;
  final Color textColor;
  final double? fontSize;
  final double? letterspace;
  final double? width;
  final String text;
  final String fontfamily;
  final Function()? onTap;
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double height;
  final double? minWidth;
  // final Gradient? gradient;
  final bool isSolid;
  final bool is_Loading;

  const RoundEdgedButton(
      {
        Key? key,
        this.color = MyColors.primaryColor,
        this.bordercolor = Colors.transparent,
        required this.text,
        this.textColor = MyColors.white,
        this.borderRadius= 4,
        this.onTap,
        this.fontSize = 16,
        this.letterspace = 2,
        this.width,
        this.fontfamily = 'bold',
        this.horizontalMargin=0,
        this.verticalMargin=0,
        this.horizontalPadding=30,
        this.verticalPadding= 6,
        this.height= 54,
        this.minWidth,
        // required this.hasGradient,
        this.isSolid=true,
        this.is_Loading=false,

      }

      )
        : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints:minWidth==null?null: BoxConstraints(
          minWidth: minWidth!
        ),
        height: height,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
        width: minWidth!=null?null:width??MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color:isSolid? color:Colors.white,
          borderRadius:BorderRadius.circular(borderRadius),
          border: Border.all(color: isSolid? bordercolor: MyColors.primaryColor, width: 1),
          // boxShadow: [
          //   boxShadow
          // ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:isSolid?textColor: MyColors.primaryColor,
                fontSize: fontSize??20,
                fontFamily: fontfamily,
                // letterSpacing: letterspace,
              ),
            ),
            if(is_Loading)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color:isSolid?textColor: MyColors.primaryColor,
                  strokeWidth: 1.6,

                ),
              )

          ],
        ),
      ),
    );
  }
}

// class RoundEdgedButtonwithimage extends StatelessWidget {
//   final Color color;
//   final Color bordercolor;
//   final Color textColor;
//   final double? fontSize;
//   final String text;
//   final String fontfamily;
//   final Function()? onTap;
//   final double horizontalMargin;
//   final double verticalMargin;
//   final double horizontalPadding;
//   final double verticalPadding;
//   final double borderRadius;
//   final double width;
//   final double height;
//   // final Gradient? gradient;
//   final bool isSolid;
//   final String image;
//
//   const RoundEdgedButtonwithimage(
//       {
//         Key? key,
//         this.color = Colors.white,
//         this.bordercolor = Colors.transparent,
//         required this.text,
//         required this.textColor,
//         this.borderRadius=15,
//         this.onTap,
//         this.fontSize = 14,
//         this.fontfamily = 'medium',
//         this.horizontalMargin=0,
//         this.verticalMargin=0,
//         this.horizontalPadding=15,
//         this.verticalPadding=8,
//         this.width= 100,
//         this.height= 38,
//         // required this.hasGradient,
//         this.isSolid=true,
//         this.image=MyImages.logo,
//
//       }
//
//       )
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: height,
//         margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
//         width: width,
//         padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
//         decoration: BoxDecoration(
//           color:isSolid? color:Colors. white10,
//           // gradient: hasGradient?gradient ??
//           //     LinearGradient(
//           //       colors: <Color>[
//           //         Color(0xFF064964),
//           //         Color(0xFF73E4D9),
//           //       ],
//           //     ):null,
//           // gradient: LinearGradient(
//           //   colors: [
//           //     Color(0xFF092774),
//           //     Color(0xFF0e3fbc),
//           //   ],
//           //   begin: Alignment.topCenter,
//           //   end:Alignment.bottomCenter,
//           //   stops: [0.0, 1.0],
//           //   tileMode: TileMode.clamp,
//           // ),
//           borderRadius:BorderRadius.circular(borderRadius),
//           border: Border.all(color: bordercolor, width: 1),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//                 image
//             ),
//             hSizedBox05,
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color:textColor,
//                   fontSize: fontSize??15,
//                   fontFamily: fontfamily
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Button_normal extends StatelessWidget {
//   final Color color;
//   final Color bordercolor;
//   final Color textColor;
//   final double? fontSize;
//   final String text;
//   final String fontfamily;
//   final Function()? onTap;
//   final double horizontalMargin;
//   final double verticalMargin;
//   final double horizontalPadding;
//   final double verticalPadding;
//   final double borderRadius;
//   final double width;
//   final double height;
//   // final Gradient? gradient;
//   final bool isSolid;
//
//   const Button_normal(
//       {
//         Key? key,
//         this.color = Colors.white,
//         this.bordercolor = Colors.transparent,
//         required this.text,
//         required this.textColor,
//         this.borderRadius=15,
//         this.onTap,
//         this.fontSize = 20,
//         this.fontfamily = 'av_book',
//         this.horizontalMargin=0,
//         this.verticalMargin=0,
//         this.horizontalPadding=15,
//         this.verticalPadding=8,
//         this.width= 100,
//         this.height= 38,
//         // required this.hasGradient,
//         this.isSolid=true,
//
//       }
//
//       )
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: height,
//         margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
//         width: width,
//         padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
//         decoration: BoxDecoration(
//           color:isSolid? color:Colors. white10,
//           borderRadius:BorderRadius.circular(borderRadius),
//           border: Border.all(color: bordercolor, width: 1),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color:textColor,
//                   fontSize: fontSize??15,
//                   fontFamily: fontfamily
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class RoundEdgedButtonred extends StatelessWidget {
//   final Color color;
//   final String text;
//   final Function()? onTap;
//   final double horizontalMargin;
//   // final Gradient? gradient;
//   final bool isSolid;
//
//   const RoundEdgedButtonred(
//       {Key? key,
//         this.color = Colors.white,
//         required this.text,
//         this.onTap,
//         this.horizontalMargin=0,
//         // required this.hasGradient,
//         this.isSolid=true})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//         decoration: BoxDecoration(
//           color:isSolid? color:Colors.transparent,
//           // gradient: hasGradient?gradient ??
//           //     LinearGradient(
//           //       colors: <Color>[
//           //         Color(0xFF064964),
//           //         Color(0xFF73E4D9),
//           //       ],
//           //     ):null,
//           borderRadius: BorderRadius.circular(30),
//           border:isSolid?null: Border.all(color: color),
//         ),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color:isSolid? Colors.white:color,
//               fontSize: 18,
//               fontFamily: 'semibold'
//           ),
//         ),
//       ),
//     );
//   }
// }



class TransparentButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function()? onTap;
  final double horizontalMargin;
  // final Gradient? gradient;
  final bool isSolid;

  const TransparentButton(
      {Key? key,
        this.color = Colors.white,
        required this.text,
        this.onTap,
        this.horizontalMargin=0,
        // required this.hasGradient,
        this.isSolid=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32,vertical: 0),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        decoration: BoxDecoration(
          color:isSolid? color:Colors.transparent,
          // gradient: hasGradient?gradient ??
          //     LinearGradient(
          //       colors: <Color>[
          //         Color(0xFF064964),
          //         Color(0xFF73E4D9),
          //       ],
          //     ):null,
          borderRadius: BorderRadius.circular(30),
          border:isSolid?null: Border.all(color: color),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color:color,
              fontSize: 18,
              fontFamily: 'semibold'
          ),
        ),
      ),
    );
  }
}

class Borderbutton extends StatelessWidget {
  final Color color;
  final String text;
  final Function()? onTap;
  final double horizontalMargin;
  // final Gradient? gradient;
  final bool isSolid;

  const Borderbutton(
      {Key? key,
        this.color = Colors.white,
        required this.text,
        this.onTap,
        this.horizontalMargin=0,
        // required this.hasGradient,
        this.isSolid=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32,vertical: 0),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          color:isSolid? color:Colors.transparent,
          // gradient: hasGradient?gradient ??
          //     LinearGradient(
          //       colors: <Color>[
          //         Color(0xFF064964),
          //         Color(0xFF73E4D9),
          //       ],
          //     ):null,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyColors.primaryColor),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: 18,
              fontFamily: 'semibold'
          ),
        ),
      ),
    );
  }
}
