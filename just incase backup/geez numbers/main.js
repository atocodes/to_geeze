function toGeezNumber(number){
    let strOfGeezNums = `፩ 1 ኣሓዱ
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
    ፻፼ 1000000 ምእት_እልፍ`
    
    //IF ERROR OCCURS FIRST CHECK ON LINE 28//

    //partitioning the numbers as object
    strOfGeezNums = strOfGeezNums.split('\n')
    strOfGeezNums = strOfGeezNums.map(e=>{
        let trim_and_split = e.trim().split(' ')
        // trim_and_split[1] = trim_and_split[1].replace(',','')
        trim_and_split[1] = parseInt(trim_and_split[1])
        return trim_and_split
    })

    let objOfGeezNums = {}
    for(let geezNum of strOfGeezNums){
        let geezNumArr = geezNum
        objOfGeezNums[geezNumArr[1]] = {
            amhNum : geezNumArr[0],
            name: geezNum[2]
        }
    }
    // console.log(objOfGeezNums)
    //logic
    let given = `${number}`

    //first we will check if the number is in the default geez numbers
    let keys = Object.keys(objOfGeezNums)
    if(keys.includes(given))return objOfGeezNums[given].amhNum

    //pulling out the written formatt
    let tenth = 1
    let times = []

    for(let i in given){
        if(i!=0 && i%4==0)tenth = 10000

        if(tenth >= 100){
            times.push(tenth)
            tenth = 1
        }

        times.push(tenth)
        tenth*=10
    }
    times.reverse()

    // console.log(times)
    // console.log(objOfGeezNums)
    
    let numbersGiven = []
    for(let i of given){
        numbersGiven.push(parseInt(i))
    }

    // console.log(numbersGiven)

    let geezFormat = []
    let count = 0

    for(let i of times){

        let calculation = i*numbersGiven[count]

        if(i == 100 || i ==10000){
            geezFormat.push(i)
            continue
        }

        geezFormat.push(calculation)
        count++
    }

    // console.log(geezFormat)

    let geezNum = []
    for(let i of geezFormat){

        if(i == 0)continue

        geezNum.push(objOfGeezNums[`${i}`].amhNum)
    }

    geezNum = geezNum.join('')
    return geezNum

}

let randomNumber = Math.floor(Math.random() * 10000000000000);
console.log(`${randomNumber} => ${toGeezNumber(randomNumber)}`)