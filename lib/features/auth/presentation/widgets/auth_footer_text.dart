import 'package:flutter/material.dart';

class AuthFooterText extends StatelessWidget {
  final String prefix;
  final String actionText;
  final VoidCallback onTap;

  const AuthFooterText({
    super.key,
    required this.prefix,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          prefix,
          style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
        ),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, // removes default horizontal padding
            minimumSize: Size(0, 0), // prevents extra height
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // tight layout
          ),
          child: Text(
            actionText,
            style: textTheme.bodyMedium?.copyWith(color: Color(0xff564290)),
          ),
        ),
      ],
    );
    // return RichText(
    //   text: TextSpan(
    // text: prefix,
    // style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
    //     //style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
    //     children: [
    //       WidgetSpan(
    //         child: GestureDetector(
    //           onTap: onTap,
    //           child: Text(
    // actionText,
    //  style: textTheme.bodyMedium?.copyWith(color: Color(0xff564290)),
    //             //style: const TextStyle(color: Color(0xff564290)),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
