import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<int> {
  LayoutCubit() : super(0);
  void changeTab(int index) => emit(index);
}
