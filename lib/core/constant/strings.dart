import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String ar = "ar";
const String en = "en";
const String dummyImage = "https://picsum.photos/800";
const String staticImage =
    "https://ramo.true-cons.net/dashboardAssets/app-assets/images/logo/logo.png";
Future<void> makePhoneCall(String phoneNumber) async {
  final Uri telUri = Uri.parse("tel:$phoneNumber");
  if (await canLaunchUrl(telUri)) {
    await launchUrl(telUri);
  } else {
    debugPrint("Could not launch $phoneNumber");
  }
}
