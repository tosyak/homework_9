import 'dart:io';
import 'dart:math';

void main() {
  cycleGame();
}

cycleGame() {
  stdout.write(
      "Choose count of game rounds up to 10. Defauls is 3. Just press enter \n ");
  String userAnswer = stdin.readLineSync()!;
  int roundCount = 0;
  if (userAnswer == '' || int.parse(userAnswer) < 3) {
    roundCount = 3;
  } else if (int.parse(userAnswer) > 10) {
    stdout.write("To mush rounds, 10 is max \n ");
  } else {
    roundCount = int.parse(userAnswer);
  }
  int cycleCount = 0;

  num userSteps = 0;
  num computerSteps = 0;

  do {
    computerSteps += binarySearch();
    stdout.write("+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+ \n ");
    userSteps += userGame();
    stdout.write("+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+ \n ");
    cycleCount++;
  } while (cycleCount != roundCount);

  stdout.write('''
_+_+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_
Computer made $computerSteps steps
User made $userSteps steps''');
}

gameMenu() {
  stdout.write(
      "Choose game mode \n 1 - Computer will guess you number \n 2 - You will guess the number \n ");
  String userAnswer = stdin.readLineSync()!;

  switch (int.parse(userAnswer)) {
    case 1:
      binarySearch();
      break;
    case 2:
      userGame();
      break;
    default:
      stdout.write("Wrong number\n ");
  }
}

int randomIntInRange(int min, int max) => min + Random().nextInt(max - min);

userGame() {
  String userAnswer = '0';
  int computerNumber = randomIntInRange(1, 128);
  print(computerNumber);
  stdout.write(
      "Try to guess the number, put it in and i'll answer greater or less \n");
  int counter = 0;

  do {
    stdout.write("Put in your number \n");
    userAnswer = stdin.readLineSync()!;
    if (int.parse(userAnswer) > computerNumber) {
      stdout.write("\nMy number is less\n\n");
    } else if (int.parse(userAnswer) < computerNumber) {
      stdout.write("\nMy number is bigger\n\n");
    } else if (int.parse(userAnswer) == computerNumber) {
      stdout.write("\nyou win \n");
    }
    counter++;
  } while (int.parse(userAnswer) != computerNumber);

  print('you have made it with $counter steps');
  return counter;
}

binarySearch() {
  var answer = '';
  var min = 0;
  var max = 128;
  var mid = ((min + max) / 2).round();
  var counter = 0;

  do {
    stdout.write("Is your number bigger or less ${mid}, input b/l or yes \n");
    answer = stdin.readLineSync()!;
    if (answer == 'l') {
      max = mid;
      mid = ((min + max) / 2).round();
    } else if (answer == 'b') {
      min = mid;
      mid = ((min + max) / 2).round();
    } else if (answer == 'yes') {
      print('you have made $counter steps');
    } else {
      print('no such command');
    }
    counter++;
  } while (answer != 'yes');
  return counter;
}
