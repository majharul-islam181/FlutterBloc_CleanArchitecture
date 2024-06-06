// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterbloc_cleanarchitecture/config/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
