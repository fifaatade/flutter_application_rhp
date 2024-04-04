
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.goBack});

  final String title;
  final bool? goBack;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {
  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      foregroundColor: Theme.of(context).colorScheme.onTertiary,
      iconTheme: IconThemeData(
        size: 45.0,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      title: Row(
        children: [
          Row(
            children: [
              if (widget.goBack == true)
                IconButton(
                  icon: const Icon(Icons.arrow_back_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              GestureDetector(
                onTap: () {
                },
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.png',
                        width: 40.0, height: 40.0),
                    const SizedBox(width: 15),
                    
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          

        ],
      ),
      toolbarHeight: 80.0,
    );
  }

  // void showPendingTicketDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return PendingTicketDialog(
  //         onSelected: (selected, id) {},
  //         vendeur: UserNew(id: 0),
  //       );
  //     },
  //   );
  // }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}