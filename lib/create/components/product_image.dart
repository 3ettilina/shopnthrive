import 'dart:io';
import 'package:flutter/material.dart';

class ProductImage extends StatefulWidget {
  final Function onClick;
  final File? image;

  const ProductImage({required this.onClick, required this.image, Key? k})
      : super(key: k);

  @override
  State<StatefulWidget> createState() => ProductImageState();
}

class ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: Card(
          child: widget.image != null
              ? Row(children: [
                  Expanded(
                    child: ClipRRect(
                      child: Image.file(widget.image!,
                          height: 180, fit: BoxFit.cover),
                    ),
                  )
                ])
              : Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      height: 180,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.grey[800],
                      ),
                    ))
                  ],
                )),
    );
  }
}
