import 'package:alonecall/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class DialButton extends StatelessWidget {
  const DialButton({
    Key key,
    @required this.iconSrc,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String iconSrc, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: Dimens.hundred,
      child: FlatButton(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.twenty,
        ),
        onPressed: press,
        child: Column(
          children: [
            SvgPicture.asset(
              iconSrc,
              color: Colors.white,
              height: 36,
            ),
            SizedBox(height: Dimens.twenty,),
            Text(
              text,
              style: Styles.white14
            )
          ],
        ),
      ),
    );
}