import 'dart:math';

String mockImageUrl() {
  final random = Random();
  final imageNumber = random.nextInt(10);
  return 'https://picsum.photos/250?image=$imageNumber';
}