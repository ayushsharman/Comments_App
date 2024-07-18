import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';

class AuthBaseWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget buttonWidget;
  final Widget switchAuthModeWidget;

  const AuthBaseWidget({
    super.key,
    required this.title,
    required this.children,
    required this.buttonWidget,
    required this.switchAuthModeWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: AppTheme.primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: children,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buttonWidget,
                  const SizedBox(height: 10),
                  switchAuthModeWidget,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
