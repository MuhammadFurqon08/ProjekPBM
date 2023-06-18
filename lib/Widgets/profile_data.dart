import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  final String dataText;
  void Function()? onTap;
  ProfileData({
    super.key,
    required this.dataText,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: 52,
        decoration: BoxDecoration(color: Color.fromRGBO(0, 157, 246, 0.5), border: Border.all(color: Colors.black, width: 2)),
        child: Text(
          dataText,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
    );
  }
}
