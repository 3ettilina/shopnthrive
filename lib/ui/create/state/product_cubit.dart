import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImageCubit extends Cubit<File?> {
  ProductImageCubit() : super(null);

  void setImage(File file) {
    emit(file);
  }
}
