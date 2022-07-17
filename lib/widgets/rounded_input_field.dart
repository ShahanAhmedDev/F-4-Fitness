import 'package:flutter/material.dart';
import 'package:pose_detection_teachable/constants/Theme.dart';
import 'package:pose_detection_teachable/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({Key? key, this.hintText, this.icon = Icons.person})
      : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: Themes.kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Themes.kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}
