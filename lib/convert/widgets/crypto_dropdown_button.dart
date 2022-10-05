// import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CryptoDropdownButton extends ConsumerStatefulWidget {
//   final 
//   const const CryptoDropdownButton({Key? key}) : super(key: key);

//   @override
//   ConsumerState<CryptoDropdownButton> createState() =>
//       _CryptoDropdownButtonState();
// }

// class _CryptoDropdownButtonState extends ConsumerState<CryptoDropdownButton> {
//   List<DropdownMenuItem> getCryptoDropdown(List<CryptoViewData> cryptoList) {
//     List<DropdownMenuItem> cryptoDropdown = cryptoList
//         .map((crypto) => DropdownMenuItem(
//               value: crypto.symbol.toUpperCase(),
//               child: Row(
//                 children: [
//                   Image.network(
//                     crypto.image,
//                     height: 24,
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     crypto.symbol.toUpperCase(),
//                   ),
//                 ],
//               ),
//             ))
//         .toList();
//     return cryptoDropdown;
//   }

//   @override
//   Widget build(BuildContext context) {
//     String cryptoSymbol = widget.crypto.symbol.toUpperCase();
//     String cryptoLogo = widget.crypto.image;
//     return DropdownButton(items: [
//       DropdownMenuItem(
//         value: cryptoSy,
//       )
//     ], onChanged: onChanged);
//   }
// }
