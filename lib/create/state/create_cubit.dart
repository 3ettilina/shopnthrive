import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(const CreateProduct());

  void changeCreateType(bool productType) {
    if (productType) {
      emit(const CreateProduct());
    } else {
      emit(const CreateCategory());
    }
  }
}
