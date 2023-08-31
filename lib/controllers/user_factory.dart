
import '../models/model_factory.dart';
import '../models/user/user.dart';

class UserFactory extends ModelFactory<User> {
  @override
  User generateFake() {
    return User(
      id: createFakeUuid(),
      email: faker.internet.email(),
      name: '${faker.person.firstName()} ${faker.person.lastName()}'.trim(),
      age: faker.randomGenerator.integer(25),
      suspended: faker.randomGenerator.boolean(),
    );
  }

  @override
  List<User> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}