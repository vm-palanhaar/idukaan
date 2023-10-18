import 'package:flutter/material.dart';

class AddIrShopNotes {
  static const s1AppBarNote = 'Basic Stall Information';
  static const s2AppBarNote = 'Payment Modes';
  static const s3AppBarNote = 'Location Details';
  static const s4AppBarNote = 'Stall License Information';

  static Text irShopLocNote() {
    return const Text(
      'To provide you with a secure and enhanced experience, our app '
      'requires access to your location. This is essential  for '
      'tagging your location, verifying shops, and displaying '
      'relevant information to passengers.',
    );
  }

  static Column irShopImgNote() {
    return const Column(
      children: [
        Text(
          '\u2022 Please upload a square-shaped photo of your stall for the '
          'best results. Square photos will be displayed prominently in search'
          ' results and will make your stall more visible to potential '
          'customers.',
        ),
        Text(
          '\u2022 Please upload a square-shaped photo of your stall for the '
          'best results. Square photos will be displayed prominently in search '
          'results and will make your stall more visible to potential customers.',
        ),
      ],
    );
  }
}

enum AddIrShopFields {
  // screen 1
  s1StallName(icon: Icons.store_outlined, title: 'Stall Name'),
  s1StallNo(icon: Icons.numbers_outlined, title: 'Stall No'),
  s1StallContactNo(icon: Icons.contact_phone_outlined, title: 'Contact Number'),
  s1StallImg(icon: Icons.image_outlined, title: 'Stall Image'),
  // screen 2
  s2Cash(icon: Icons.money_outlined, title: 'Cash'),
  s2Upi(icon: Icons.qr_code_outlined, title: 'UPI'),
  s2Card(icon: Icons.credit_card_outlined, title: 'Card'),
  // screen 3
  s3Station(icon: Icons.train_outlined, title: 'Railway Station'),
  s3Toa(icon: Icons.place_outlined, title: 'Type of Area'),
  s3Plt(icon: Icons.location_pin, title: 'Platform Number (if applicable)'),
  s3Plt1(icon: Icons.location_pin, title: 'Platform (A)'),
  s3Plt2(icon: Icons.location_pin, title: 'Platform (B)'),
  // screen 4
  s4LicNo(icon: Icons.confirmation_number_outlined, title: 'License Number'),
  s4LicDoc(icon: Icons.file_present_outlined, title: 'Document (.pdf)'),
  s4LicSd(icon: Icons.date_range_outlined, title: 'Start Date'),
  s4LicEd(icon: Icons.date_range_outlined, title: 'End Date'),
  ;

  const AddIrShopFields({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
}
