part of './view/home_screen.dart';

AppBar _homeAppBar(BuildContext context) => AppBar(
      title: const Text(
        "Home",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
