import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title, this.goBack, this.colr});

  final String title;
  final bool? goBack;
  var colr;

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
      elevation: 0,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 25,
              color: widget.colr != null ? Colors.white : null,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
      automaticallyImplyLeading: false,
      backgroundColor: widget.colr == null
          ? Theme.of(context).colorScheme.tertiary
          : widget.colr,
      foregroundColor: Theme.of(context).colorScheme.onTertiary,
      iconTheme: IconThemeData(
        size: 45.0,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      centerTitle: false,
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
            ],
          ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.colr != null ? Colors.white : null,
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
