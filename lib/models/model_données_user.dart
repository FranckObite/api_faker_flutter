/* import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_card.freezed.dart';

@freezed
class BusinessCard with _$BusinessCard {
  const factory BusinessCard({
    required String name,
    required String email,
    required String phone,
  }) = _BusinessCard;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card Generator',
      home: BusinessCardList(),
    );
  }
}

class BusinessCardList extends StatelessWidget {
  
  final faker = Faker();

  final cards = List.generate(
    10,
    (index) => BusinessCard(
      name: faker.person.name(),
      email: faker.internet.email(),
      phone: faker.phoneNumber.phoneNumber(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Card Generator'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return ListTile(
            title: Text(card.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.email),
                Text(card.phone),
              ],
            ),
          );
        },
      ),
    );
  }
}
 */