import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/features/pets/data/repository/pet_repository.dart';

import 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  final PetRepository repository;

  PetCubit(this.repository) : super(PetInitial());

  void loadPets() {
    final pets = repository.fetchMockPets();
    emit(PetLoaded(pets));
  }
}
