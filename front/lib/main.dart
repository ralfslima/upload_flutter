// ignore_for_file: avoid_print // Comando utilizado para remover o sublinhado do método print, avoid_print
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // Necessário para realizar o uplad
import 'package:image_picker_web/image_picker_web.dart'; // Widget/Componente responsável pelo botão de upload

// Método de execução
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UploadScreen(),
    );
  }
}

// Stateful
class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadScreenState createState() => _UploadScreenState();
}

// State
class _UploadScreenState extends State<UploadScreen> {
  MediaInfo? _imageInfo;

  // Método responsável por obter o nome da imagem
  Future<void> _pickImage() async {
    MediaInfo? mediaInfo = await ImagePickerWeb.getImageInfo;
    setState(() {
      _imageInfo = mediaInfo;
    });
  }

  // Método _uploadImage para realizar o upload e retornar via console a situação (ele armazena apenas o arquivo e não o nome dele)
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
        print("Upload realizado com sucesso: ${response.data}");
      } catch (e) {
        print("Falha: $e");
      }
    } else {
      print("Nenhuma imagem selecionada.");
    }
  }

  // Estrutura front-end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload de Imagem"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageInfo == null
                ? const Text("Nenhuma imagem selecionada.")
                : Image.memory(
                    _imageInfo!.data!,
                    width: 300,
                    height: 300,
                  ),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Selecionar Imagem"),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text("Enviar Imagem"),
            ),
          ],
        ),
      ),
    );
  }
}
