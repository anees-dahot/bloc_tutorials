import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/image%20picker/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class CameraCaptureBloc extends Bloc<ImagePickerEvent, CameraCaptureState> {
  CameraCaptureBloc() : super(const CameraCaptureState()) {
    on<CamerCaptureEvent>(camerCaptureEvent);
  }

  FutureOr<void> camerCaptureEvent(
      CamerCaptureEvent event, Emitter<CameraCaptureState> emit) async {
    XFile? file = await ImagePickerUtils().cameraCapture();

    emit(state.copyWith(file: file));
  }
}

class PickFromGalleryBloc extends Bloc<ImagePickerEvent, PickFromGalleryState> {
  PickFromGalleryBloc() : super(const PickFromGalleryState()) {
    on<PickFromGalleryEvent>(pickFromGalleryEvent);
  }

  FutureOr<void> pickFromGalleryEvent(
      PickFromGalleryEvent event, Emitter<PickFromGalleryState> emit) async {
    XFile? file = await ImagePickerUtils().pickFromGallery();

    emit(state.copyWith(file: file));
  }
}
