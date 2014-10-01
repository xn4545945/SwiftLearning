// Playground - noun: a place where people can play

import UIKit

//1.数据类型
//基本Int、Float、Double、Bool、Character、String(首字母都大写)
//Array、Dictionary、元组类型(Tuple)、可选类型(Optional)

let a:Int = 10  //指定数据类型。 一般不需要指定，会自动判断类型。 （使用时需初始化）

//1.1整形
let maxInt = Int.max     //获取Int类型的最大值
let minInt = Int.min

let a1 = 10    //十进制
let a2 = 0b1010  //二进制以0b开头
let a3 = 0o12   //八进制以0o开头
let a4 = 0xA    //十六进制0x


//1.2浮点型Float,Double
let b1 = 0.123    //默认是Double
let b2 = 0.123e3  //123.0

//1.3Bool (不是YES/NO了)
let c1 = true
let c2 = false

//1.4元组. 可以是N个任意类型的数据
let tup1 = (age:1,name:"abc",hight:2,jj:0.1)  //带元素名称
let tup2 = (1,"abc",2,0.1)   //省略元素名称

var tup3:(Int,String) = (1,"haha")   //指定类型. (指定类型后就不能再写元素名称了)

var (t1,t2) = tup3   //直接弄2个变量接收元祖
var (_,t3)  = tup3   //只接收一个

//根据元素名访问
tup1.age
tup1.name

//根据位置访问
tup3.0    //访问元素,即1
tup3.1    //访问元素,即2

println(tup3)   //输出

//1.5 可选类型。（要么返回该值，要么为nil）
var possibleNumber = "123"
var convertedNumber:Int? = possibleNumber.toInt()   //转换可能失败. (在类型后面加？表示可选)

//获取可选类型的值，需要在后面加上！
if convertedNumber != nil{
    println("convertedNumber的值为\(convertedNumber!)")
}

//OC中的nil指向一个不存在的对象， 而Swift中nil不是指针，而是一个缺省值
//possibleNumber = nil   //普通的变量是不能赋值为nil
//convertedNumber = nil    //可选类型能赋值为nil， 当没有值时，自动赋值为nil

if let my = convertedNumber {
    println("这是可选绑定！\(my)")
}


//===========================================================================

//2.数字格式与类型转换
//2.1可以在数字中增加额外的0或_, 增强可读写
let d1 = 000123
let d2 = 00123.0012300

let d3 = 1_2_3
//let d4 = _123   //错误


//2.2类型转换
let e1 = 1
let e2 = 0.12
//let e3 = e1 + e2  //错误, 类型不同不能直接相加
let e3 = Double(e1) + e2   //类型转换

//2.3 类型别名 typealias
typealias XNInt = Int
let test:XNInt = 10

//===========================================================================

//3.运算符,新增加范围运算符,溢出运算符
//3.1 范围运算符..<   ...
for index1 in 1...10{ }  //表示闭包[1 10]
for index2 in 1..<10{ }  //表示半闭合[1 10)

//3.2 溢出运算符 &+溢出加 &-溢出减 &*溢出乘 &/溢出除 &%溢出余
let f1 = UInt.max
//let f2 = x + 1  //这样写会上溢
let f2 = f1 &+ 1   //溢出加. 值为0. 变为溢出后的最小值

let g1 = 10
//let g2 = g1 / 0  //会报错
let g2 = g1 &/ 0   //值为0
//let g3 = g1 % 0  //会报错
let g3 = g1 &% 0   //值为0

//3.3注意, Swift中的赋值没有返回值
let (x,y) = (1,2)    //整体赋值
//if(x = y){ }    //这样写是错误的. 能防止将==写成=
//if(10){ }     //这样写也是错误的. 非0即真已经不适用.
if(true){ }

//===========================================================================
//4.流程控制(控制语句后一定要写花括号{})
//4.1循环for in
for h1 in 1...10{
    println(h1)
}

for _ in 1..<10{    //不需要用到范围中的值时,直接忽略用_
    println("####")
}

//4.2标签, 可以用来指定退出那个循环. (标签名中级随便取)
xn:
    for _ in 1...3 {
        println("***")
        for tmp in 1...5{
            println("###")
            //指定退出
            if tmp == 3{
                break xn
            }
        }
}


//4.3选择switch
//1.与C语言中的不同. 不必每个case下写break,自动break
//2.每个case后面必须有可执行语句, 否则会报错
//3.每个case都可以匹配多个条件, 也可以填写一个范围
//4.switch要保证处理所有的情况,一定加上default,不然编译器会报错.
//5.case还可以匹配元祖
let score = 10
switch score{
case 0...3:
    println("差")
case 4,5,6,7:
    println("良")
case 8...10:
    println("优")
default:
    println("超神")
}





