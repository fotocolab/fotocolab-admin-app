import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/util/file_manager/file_manager.dart';
import 'package:fotocolab_admin/util/image/image_manager.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class CanvasScreen extends ConsumerStatefulWidget {
  const CanvasScreen({super.key});

  @override
  ConsumerState<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends ConsumerState<CanvasScreen> {
  Uint8List? i;

  Future<void> attachOnTap() async {
    var f = await FileManager.uploadSingle();
    var b = await f?.xFile.readAsBytes();
    try {
      i = await generateInstagramPoster(
        imageBytes: b!,
        title: 'Dont bothered your qualms',
      );
    } catch (e) {
      //
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: BrandAppBar(),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BrandButton.primary(title: 'Attach', onTap: attachOnTap),
              BrandVSpace.gap10(),
              i == null ? CircularProgressIndicator() : Image.memory(i!),
            ],
          ),
        ),
      ),
    );
  }
}
