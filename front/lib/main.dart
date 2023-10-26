import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker_web/image_picker_web.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadScreen(),
    );
  }
}

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  MediaInfo? _imageInfo;

  Future<void> _pickImage() async {
    MediaInfo? mediaInfo = await ImagePickerWeb.getImageInfo;
    setState(() {
      _imageInfo = mediaInfo;
    });
  }

  Future<void> _uploadImage() async {
    if (_imageInfo != null) {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(
          _imageInfo!.data!,
          filename: _imageInfo!.fileName,
        ),
      });

      try {
        Response response =
            await dio.post("http://localhost:3000/upload", data: formData);
        print("Upload successful! Response: ${response.data}");
      } catch (e) {
        print("Error during upload: $e");
      }
    } else {
      print("Nenhuma imagem selecionada.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload de Imagem"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageInfo == null
                ? Text("Nenhuma imagem selecionada.")
                : Image.memory(
                    _imageInfo!.data!,
                    width: 300,
                    height: 300,
                  ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Selecionar Imagem"),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text("Enviar Imagem"),
            ),
          ],
        ),
      ),
    );
  }
}
