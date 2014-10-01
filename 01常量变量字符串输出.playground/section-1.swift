// Playground - noun: a place where people can play

import UIKit


//1.所见即所得
var str = "Hello, playground"
var a = 10
a = 10 + 10 + 10 + 10

//2.实时观察变量状态和变化情况
var num:Double
for i in 0...100{
    num = sin(Double(i)/10)
}


//3.对UI控件也能实时观察
var button  = UIButton();
button.frame = CGRectMake(0, 0, 100, 100)
button.backgroundColor = UIColor.redColor()  //点击右边，可以看到变成红色了
button.layer.cornerRadius = 10;  //圆角
button.backgroundColor = UIColor.greenColor();


//字符串的拼接操作. (以前都是stringWithFormat来拼接字符串)
var str1 = "xu"
var str2 = "neng"
var str3 = str1 + " " + str2

//字符串中插入变量等
var name = "小明"
var age = 10
var result = "\(name) 的年龄是 \(age) 岁!"
//var result = name + "的年龄是" + age + "岁!"   //这样写是错误的, swift中类型不同不能相加

//打印与输出
print("Hello World!")   //不换行打印
println("Hello world!") //换行打印

let testStr = "abcdefg"
print(testStr)

//常量与变量的命名. 不能包含一些特殊的数学符号+-*/,单独的下画线,关键字等
let π = 3.1415926
let 徐能 = "哈哈哈"
let 😘 = 10
print(😘)

