import 'dart:io';

import 'package:bloc_practice/image%20picker/bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CameraCaptureBloc, CameraCaptureState>(
            bloc: context.read<CameraCaptureBloc>(),
            builder: (context, state) {
              if (state.file == null) {
                return GestureDetector(
                  onTap: () {
                    context.read<CameraCaptureBloc>().add(CamerCaptureEvent());
                  },
                  child: Text('Capture'),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    context.read<CameraCaptureBloc>().add(CamerCaptureEvent());
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          File(
                            state.file!.path.toString(),
                          ),
                        ),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 40,
          ),
          BlocBuilder<PickFromGalleryBloc, PickFromGalleryState>(
            bloc: context.read<PickFromGalleryBloc>(),
            builder: (context, state) {
              if (state.file == null) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<PickFromGalleryBloc>()
                        .add(PickFromGalleryEvent());
                  },
                  child: Text('Pick'),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<PickFromGalleryBloc>()
                        .add(PickFromGalleryEvent());
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                FileImage(File(state.file!.path.toString())))),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
