import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;


class ImageInputWidget extends StatefulWidget {

  Function selectImageRef;
  ImageInputWidget(this.selectImageRef);
  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File _storedImage;

  _takePicture() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _storedImage = imageFile;
    });

    final appDid = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDid.path}/$fileName');
    if(savedImage == null)
      return;
    widget.selectImageRef(savedImage);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Padding( padding: EdgeInsets.symmetric(horizontal: 3.0), child: Text('No image taken', textAlign: TextAlign.center)),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        Expanded(
            child: FlatButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text('Take picture'),
          textColor: Theme.of(context).primaryColor,
        ))
      ],
    );
  }
}
