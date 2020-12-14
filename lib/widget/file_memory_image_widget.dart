import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_example/widget/button_widget.dart';
import 'package:image_picker/image_picker.dart';

class FileMemoryImageWidget extends StatefulWidget {
  @override
  _FileMemoryImageWidgetState createState() => _FileMemoryImageWidgetState();
}

class _FileMemoryImageWidgetState extends State<FileMemoryImageWidget> {
  bool isFile = false;
  File fileImage;
  Uint8List memoryImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            if (fileImage == null && memoryImage == null)
              Container(
                height: 406,
                child: Center(
                  child: Text(
                    'No Image',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ),
            if (fileImage != null) buildFileImage(),
            if (memoryImage != null) buildMemoryImage(),
            const SizedBox(height: 32),
            buildButton(),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Text(
                    isFile ? 'Load As File' : 'Load As Memory',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: CupertinoSwitch(
                    value: isFile,
                    onChanged: (value) => setState(() {
                      isFile = value;

                      if (isFile) {
                        memoryImage = null;
                      } else {
                        fileImage = null;
                      }
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFileImage() => Column(
        children: [
          CircleAvatar(
            backgroundImage: FileImage(fileImage),
            radius: 120,
          ),
          const SizedBox(height: 16),
          Image.file(
            fileImage,
            height: 150,
            fit: BoxFit.cover,
          ),
        ],
      );

  Widget buildMemoryImage() => Column(
        children: [
          CircleAvatar(
            backgroundImage: MemoryImage(memoryImage),
            radius: 120,
          ),
          const SizedBox(height: 16),
          Image.memory(
            memoryImage,
            height: 150,
            fit: BoxFit.cover,
          ),
        ],
      );

  Widget buildButton() => ButtonWidget(
        text: 'Pick Image',
        onClicked: () async {
          final picker = ImagePicker();
          final pickedFile = await picker.getImage(source: ImageSource.gallery);

          if (pickedFile == null) return;

          if (isFile) {
            final file = File(pickedFile.path);

            setState(() {
              fileImage = file;
            });
          } else {
            final bytes = await pickedFile.readAsBytes();

            setState(() {
              memoryImage = bytes;
            });
          }
        },
      );
}
