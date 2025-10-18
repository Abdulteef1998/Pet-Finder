import 'package:pet_finder/features/pets/data/models/pet_model.dart';

abstract class PetState {}

class PetInitial extends PetState {}

class PetLoaded extends PetState {
  final List<PetModel> pets;
  PetLoaded(this.pets);
}
