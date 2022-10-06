import 'dart:math';

void main() {
  final random = Random();
  // int numberGenerate = (random.nextDouble() * 10000000000).floor();
  // print('$numberGenerate => ${toGeeze(numberGenerate)}');
  print(toGeeze(101));
}

toGeeze(int number) {
  String strOfGeezeNumbers = '''፩ 1 ኣሓዱ
    ፪ 2 ክልኤቱ
    ፫ 3 ሠለስቱ
    ፬ 4 ኣርባዕቱ
    ፭ 5 ሓምስቱ
    ፮ 6 ስድስቱ
    ፯ 7 ሰብዓቱ
    ፰ 8 ሰመንቱ
    ፱ 9 ተስዓቱ
    ፲ 10 ዓሠርቱ
    ፳ 20 ዕሥራ
    ፴ 30 ሠላሳ
    ፵ 40 ኣርባዓ
    ፶ 50 ሓምሳ
    ፷ 60 ስሳ
    ፸ 70 ሰብዓ
    ፹ 80 ሰማንያ
    ፺ 90 ተስዓ
    ፻ 100 ምእት
    ፼ 10000 እልፍ
    ፻፼ 1000000 ምእት_እልፍ''';

  List listOfGeezeNumbers = strOfGeezeNumbers.split('\n');
  listOfGeezeNumbers = listOfGeezeNumbers.map((e) {
    var trimAndSplit = e.trim().split(' ');
    return trimAndSplit;
  }).toList();

  Map<int, Map<String, String>> mapOfGeezeNumbers = {};
  for (var geezeNums in listOfGeezeNumbers) {
    List geezeNumArr = geezeNums;
    mapOfGeezeNumbers[int.parse(geezeNumArr[1])] = {
      'amhNum': geezeNumArr[0],
      'name': geezeNumArr[2]
    };
  }

  //Logic

  String given = '$number';

  List keys = mapOfGeezeNumbers.keys.toList();
  if (keys.contains(number)) {
    var result = mapOfGeezeNumbers[number];
    return result?['amhNum'];
  }
  ;

  //pulling out the written formatt
  int tenth = 1;
  List<int> times = [];
  List<int> numbersGiven = [];

  for (var i = 0; i <= given.length - 1; i++) {
    numbersGiven.add(int.parse(given[i]));
    if (i != 0 && i % 4 == 0) tenth = 10000;

    if (tenth >= 100) {
      times.add(tenth);
      tenth = 1;
    }

    times.add(tenth);
    tenth *= 10;
  }
  times = times.reversed.toList();

  List<int> geezeFormatt = [];
  int count = 0;

  for (var i in times) {
    int calculation = i * numbersGiven[count];

    if (i == 100 || i == 10000) {
      geezeFormatt.add(i);
      continue;
    }

    geezeFormatt.add(calculation);
    count++;
  }

  //here if the number is greater than or equals to 100 and less than 200
  //it removes the first number in array

  if (number < 200 && number >= 100) {
    if (geezeFormatt[0] == 1) geezeFormatt.removeAt(0);
  }
  // print(geezeFormatt);

  List<String> geezeNum = [];
  for (var i in geezeFormatt) {
    if (i == 0) continue;
    geezeNum.add('${mapOfGeezeNumbers[i]?['amhNum']}');
  }

  String finalNumber = geezeNum.join('');
  return finalNumber;
}
