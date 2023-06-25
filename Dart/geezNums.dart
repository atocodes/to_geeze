class GeezNums {
  final String _strOfGeezeNumbers = '''፩ 1 ኣሓዱ
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

  // ? Conversion Methods
  /* 
    ! _ToListOfListString
    _ToListOfListString methods takes the 
    _OfGeezeNumbers as arg 
    and splits to 
    * List<List<String>> Type List
  */
  List<List<String>> _ToListOfListString() {
    List<List<String>> listOfList =
        _strOfGeezeNumbers.split('\n').map((string) {
      List<String> trimAndSplit = string.trim().split(' ');
      return trimAndSplit;
    }).toList();

    return listOfList;
  }

  /*
    ! _listOfListToMap
    _listOfListToMap method takes the 
    what _ToListofString converted as arg
    and converts to 
    * Map<int,Map<String,String>> Type Map
  */

  Map<int, Map<String, String>> _ToMap(List<List<String>> list) {
    Map<int, Map<String, String>> mapOfGeezNumbers = {};

    for (List listItem in list) {
      mapOfGeezNumbers[int.parse(listItem[1])] = {
        "geezNum": listItem[0],
        "numberName": listItem[2]
      };
    }
    return mapOfGeezNumbers;
  }

  List<int> _MapKeys() => _ToMap(_ToListOfListString()).keys.toList();

  bool _GivenExistOnMap(int given) => _MapKeys().contains(given);

  // ? Generation Logic

  List<int> _ConvertToGeezWrittenFormat(String arabicNumber) {
    int tenth = 1;
    List<int> tenTimes = [];
    List<int> givenNumbers = [];

    for (var i = 0; i <= arabicNumber.length - 1; i++) {
      givenNumbers.add(int.parse(arabicNumber[i]));
      if (i != 0 && i % 4 == 0) tenth = 10000;

      if (tenth >= 100) {
        tenTimes.add(tenth);
        tenth = 1;
      }

      tenTimes.add(tenth);
      tenth *= 10;
    }

    List<int> geezFormat = [];
    int count = 0;

    for (var tenTime in tenTimes) {
      int cal = tenTime * givenNumbers[count];

      if (tenTime == 100 || tenTime == 10000) {
        geezFormat.add(tenTime);
        continue;
      }
      geezFormat.add(cal);
      count++;
    }

    //here if the number is greater than or equals to 100 and less than 200
    //it removes the first number in array
    int givenNum = int.parse(arabicNumber);
    if (givenNum < 200 && givenNum >= 100) {
      if (geezFormat[0] == 1) geezFormat.removeAt(0);
    }
    
    print(tenTimes);
    print(givenNumbers);
    print(geezFormat);

    return geezFormat;
  }

  Map<String, String> ToGeeze(int number) {
    String GivenStrNumber = '$number';
    List<String> NumberName = [];
    List<String> GeezNumber = [];

    List<List<String>> listOfGeezeNumbers = _ToListOfListString();

    Map<int, Map<String, String>> mapOfGeezNumbers = _ToMap(listOfGeezeNumbers);

    // ! returns from mapOfGeezeNumbers if the given number exists in the map initial data
    if (_GivenExistOnMap(number))
      return mapOfGeezNumbers[number] as Map<String, String>;

    List<int> geezForamt = _ConvertToGeezWrittenFormat(GivenStrNumber);

    // ? Generates the Geez Number And Name form mapOfGeeezNumbers
    for (var i in geezForamt) {
      if (i == 0) continue;
      GeezNumber.add('${mapOfGeezNumbers[i]?['geezNum']}');
      NumberName.add('${mapOfGeezNumbers[i]?['numberName']}');
    }

    if (NumberName.length > 1 && number % 10 != 0)
      NumberName[NumberName.length - 1] =
          'ወ${NumberName[NumberName.length - 1]}';

    return {
      'geezNum': GeezNumber.join(''),
      'numberName': NumberName.join(' '),
    };
  }
}
