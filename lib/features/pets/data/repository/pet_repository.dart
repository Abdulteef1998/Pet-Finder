import '../models/pet_model.dart';

class PetRepository {
  List<PetModel> fetchMockPets() {
    return [
      PetModel(
        name: 'Joli',
        gender: 'Female',
        age: '5 Months Old',
        distance: 1.6,
        image: 'assets/images/cat.png',
      ),
      PetModel(
        name: 'Tom',
        gender: 'Male',
        age: '1 Year Old',
        distance: 2.7,
        image: 'assets/images/dog1.png',
      ),
      PetModel(
        name: 'Oliver',
        gender: 'Male & Female',
        age: '3 Months Old',
        distance: 2.0,
        image: 'assets/images/birds.png',
      ),
      PetModel(
        name: 'Shelly',
        gender: 'Female',
        age: '1.5 Year Old',
        distance: 3.0,
        image: 'assets/images/dog2.png',
      ),
    ];
  }
}
