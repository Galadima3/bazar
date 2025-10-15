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
          style: textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey.shade700,
          ),
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
            style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.dark ? Color.fromARGB(255, 152, 128, 224) : Color(0xff564290)),
          ),
        ),
      ],
    );
  }
}
