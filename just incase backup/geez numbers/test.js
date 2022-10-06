let number = '1100'
let tenth = 1
let times = []
for(let i in number){
    if(i!=0 && i%4==0)tenth = 10000
    if(tenth >= 100){
        times.push(tenth)
        tenth = 1
    }
    if(number[i] == '0')continue
    times.push(tenth)
    tenth*=10
}
times.reverse()
console.log(times)