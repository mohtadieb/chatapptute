import 'package:chatapptute/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    // light vs dark mode for correct bubble colors
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? Colors.green
            : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.symmetric(vertical: 7, horizontal:  28),
      child: Text(
          message,
          style: TextStyle(
              color: isCurrentUser
                  ? Colors.white
                  : (isDarkMode ? Colors.white : Colors.black)),
      ),
    );
  }
}
