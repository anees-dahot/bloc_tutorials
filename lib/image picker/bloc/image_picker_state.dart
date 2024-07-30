// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_picker_bloc.dart';

class CameraCaptureState extends Equatable {
  final XFile? file;
  const CameraCaptureState({
    this.file,
  });

  CameraCaptureState copyWith({
    XFile? file,
  }) {
    return CameraCaptureState(
      file: file ?? this.file,
    );
  }

  @override
  List<Object?> get props => [file];
}

class PickFromGalleryState extends Equatable {
  final XFile? file;
  const PickFromGalleryState({
    this.file,
  });

  PickFromGalleryState copyWith({
    XFile? file,
  }) {
    return PickFromGalleryState(
      file: file ?? this.file,
    );
  }

  @override
  List<Object?> get props => [file];
}
