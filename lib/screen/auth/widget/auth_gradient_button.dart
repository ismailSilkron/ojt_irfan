import 'package:flutter/material.dart';
import 'package:ojt_irfan/config/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const AuthGradientButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppPallete.gradient1,
            AppPallete.gradient2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
        ),
        child: Text(title),
      ),
    );
  }
}
