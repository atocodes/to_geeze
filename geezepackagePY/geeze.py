class Geeze:

    def toGeezeNumber(self,number):
        strOfGeezeNums = '''፩ 1 ኣሓዱ
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
        ፻፼ 1000000 ምእት_እልፍ'''

        strOfGeezeNums = strOfGeezeNums.split('\n')
        strOfGeezeNums = list(map(lambda _str : _str.strip(' '),strOfGeezeNums))

        dictOfGeezeNums = {f'{x.split()[1]}':{
            'amhNum':x.split()[0],
            'name':x.split()[2]
        } for x in strOfGeezeNums}

        result = {}

        given = str(number)

        geezeNumName = []

        keys = dictOfGeezeNums.keys()
        if given in keys:
            result['number'] = dictOfGeezeNums[given]['amhNum']
            result['name'] = dictOfGeezeNums[given]['name']
            return result

        tenth = 1
        times = []

        for i in given:
            i = int(i)
            if i!=0 and i%4==0:
                tenth = 1000
            
            if tenth >= 1000:
                times.append(tenth)
                tenth = 1
            times.append(tenth)
            tenth*=10

        times.reverse()

        numbersGiven = []
        for i in given:
            numbersGiven.append(int(i))

        geezeFormat = []
        count = 0
        for i in times:
            calculation = i * numbersGiven[count]

            if i == 100 or i == 10000:
                geezeFormat.append(i)
                continue

            geezeFormat.append(calculation)
            count+=1
        
        if number < 200 and number >= 100:
            if geezeFormat[0] == 1:
                geezeFormat.pop(0)

        geezNum = []

        for i in geezeFormat:
            if i == 0:
                continue

            geezNum.append(dictOfGeezeNums[str(i)]['amhNum'])
            geezeNumName.append(dictOfGeezeNums[str(i)]['name'])

        if len(geezeNumName) > 1 and number%10 != 0:
            geezeNumName[len(geezeNumName) - 1] = f'ወ{geezeNumName[len(geezeNumName) - 1]}' 

        geezeNumName = ' '.join(geezeNumName)
        geezNum = ''.join(geezNum)

        result['number'] = geezNum
        result['name'] = geezeNumName
        print(geezNum)
        return result

        
geeze = Geeze()
print(geeze.toGeezeNumber(21))
print(geeze.toGeezeNumber(20))