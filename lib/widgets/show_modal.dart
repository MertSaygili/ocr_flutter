import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context, {VoidCallback? onTapCamera, VoidCallback? onTapGalery}) {
  Icon iconCamera = const Icon(Icons.camera);
  Icon iconGalery = const Icon(Icons.image);
  String camera = 'Camera';
  String galery = 'Galery';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              InkWell(onTap: onTapCamera, child: ListTile(leading: iconCamera, title: Text(camera), onTap: onTapCamera)),
              InkWell(onTap: onTapGalery, child: ListTile(leading: iconGalery, title: Text(galery), onTap: onTapGalery)),
            ],
          ),
        ],
      );
    },
  );
}
