// import 'package:first_project/screens/models/Product.dart';
// import 'package:flutter/material.dart';

// import '../../size_config.dart';
// import 'product_card.dart';
// import 'section_titles.dart';

// class PopularProduct extends StatelessWidget {
//   const PopularProduct({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SectionTitle(
//           text: "Popular Product",
//           press: () {},
//         ),
//         SizedBox(height: getProportionateScreenWidth(20)),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               ...List.generate(
//                 demoProducts.length,
//                 (index) => ProductCard(
//                   product: demoProducts[index],
//                 ),
//               ),
//               SizedBox(width: getProportionateScreenWidth(20)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
