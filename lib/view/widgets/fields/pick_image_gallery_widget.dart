import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageGalleryWidget extends StatefulWidget {
  final String labelText;
  final Function onPressed;

  const PickImageGalleryWidget({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  @override
  State<PickImageGalleryWidget> createState() => _PickImageGalleryWidgetState();
}

class _PickImageGalleryWidgetState extends State<PickImageGalleryWidget> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.image_outlined),
          title: Text(widget.labelText),
          trailing: const Icon(Icons.upload),
          onTap: () async {
            image = await picker.pickImage(
              source: ImageSource.gallery,
            );
            widget.onPressed(image!.path);
            setState(() {});
          },
        ),
        if (image != null && image!.path.isNotEmpty)
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image(
                  image: FileImage(
                    File(
                      image!.path,
                    ),
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.onPressed('');
                  image = null;
                  setState(() {});
                },
                icon: const CircleAvatar(
                  child: Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
