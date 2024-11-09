import 'package:finkin/core/constants/app_color.dart';
import 'package:flutter/material.dart';

// class CustomInfoDialog extends StatelessWidget {
//   const CustomInfoDialog({
//     super.key,
//     required this.title,
//     this.widget,
//   });
//   final String title;

//   final Widget? widget;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Dialog(
//         alignment: Alignment.center,
//         insetPadding: const EdgeInsets.all(10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(0),
//         ),
//         elevation: 1,
//         backgroundColor: Colors.white,
//         child: Wrap(children: [
//           Container(
//             constraints: BoxConstraints(maxWidth: width * 0.3),
//             color: Colors.white,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   color: const Color.fromARGB(255, 227, 24, 55),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           title,
//                           style: const TextStyle(
//                             color: AppColor.white,
//                             fontWeight: FontWeight.bold,
//                           ),
                          
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.close,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 widget!,
//               ],
//             ),
//           ),
//         ]));
//   }
// }

class DialogExample extends StatelessWidget {
  const DialogExample({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Container(
        padding: EdgeInsets.all(16),
        height: 90,
        decoration: const BoxDecoration(
          color: AppColor.red,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            SizedBox(width: 48,),
            Expanded(child: Column(
              children: [
                Text(title),
            Text(message)
              ],
            ))
            
          ],
        ),
      )
      );
  }
}

