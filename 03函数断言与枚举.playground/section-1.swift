// Playground - noun: a place where people can play
import UIKit

//1.函数的写法
//1.1 无返回值, 无形参
func myTest2(){
    println("Hello")
}

//1.2 有返回值，有形参
func myTest1( num1:Int , num2:Int ) -> String{
    return String(num1 + num2)
}

//1.3 外部参数. (相当于给参数起了个别名, 方便识别记忆)
func myTest3 (myNum1 num1 :Int ,myNum2 num2: Int){
    println(num1 + num2)
}
myTest3(myNum1: 1, myNum2: 2) //调用

func myTest4 (#num1 :Int ,#num2: Int){   //前面加#表示直接用形参名作为外部参数名
    println(num1 + num2)
}
myTest4(num1: 2, num2: 3)

//1.4 默认参数. (类似C++)
func myTest5(num1:Int , num2:Int = 10){
    println(num1+num2)
}
myTest5(1)
myTest5(1, num2: 22)    //后面一个参数默认是以形参为外部参数名的

func myTest6(num1:Int , _ num2:Int = 10){   //忽略形参的外部参数名, 在参数前加_
    println(num1+num2)
}
myTest6(1, 22)

//1.5 常量与变量参数. (默认情况下,Swift的参数都是常量参数, 是不能修改的)
//其他语言中, 如C语言是没有这个概念的. 可以随意修改
func myTest7(let num1:Int, num2:Int){
//    num2 = 10   //这句是错误的, 不能修改
    println(num1+num2)
}

func myTest8(var num1:Int, num2:Int){  //加上var即可, 变为变量参数. 可以修改
    num1 = 10
    println(num1+num2)
}

//1.6 输入输出参数inout(作用类似于C语言中的指针)
//经典的交换函数
func swap(inout num1:Int ,inout num2:Int){  //在参数前加inout即可
    var tmp = num1
    num1 = num2
    num2 = tmp
}

var n1 = 10;
var n2 = 11;
swap(&n1, &n2)  //加上类似C语言的取地址符号&
println("n1 = \(n1), n2 = \(n2)")


//1.7 函数类型. (函数也看做是数据类型的一种, 可以当参数, 定义变量, 作为返回值等)
//注意:定义变量时不写的类型的话, 默认会自动判断类型. 当再次使用该变量时, 一定要注意类型匹配的问题
//如上面1.2中函数myTest1的类型即为 (Int , Int) -> String
var myFun1 = myTest1   //变量myFun的类型为(Int , Int) -> String
myFun1(10,10)    //结果为20

func myFun2(fun:(Int,Int)->String , num1:Int , num2:Int){//函数作为参数
    println(fun(num1 , num2))
}
myFun2(myFun1, 11, 11)
//同理,函数还可以作为返回值

//1.8 函数重载(和Java差不多, 只是Java中与返回值无关)
func testOverload(num1:Int){
    println("...")
}

func testOverload(num1:Int , num2:Int) ->Double{
    println("...")
    return 0.1
}

func testOverload(num1:Int , num2:Int) -> Int{
    println("...")
    return num1 + num2
}

testOverload(10)
var dou:Double = testOverload(10,11)   //一定要找个接收的具体类型来唯一标识

//1.9 嵌套函数. (嵌套函数的作用域仅限于函数内部)
func doSomething(num:Int){
    func walk(){  println("working!") }
    func eat(){ println("eating") }
    
    if num == 1{
        walk()
    }else{
        eat()
    }
}

doSomething(1)
doSomething(2)
//eat()    //不能直接在外面调用

//==========================================================
//2.断言(和C语言基本一样)
var a = 10
assert(a>5, "Right")

//==========================================================
//3.枚举
//不会像C语言中一样，默认会被赋值为0，1。。。
//3.1枚举格式
enum CompassPoint{
    case North    //case表示新的一行成员被定义
    case South
    case East
    case West
    case A, B, C   //多个成员也可以出现在同一行上
}

//3.2 访问枚举
var direct = CompassPoint.North
direct = .South       //因为前面访问过, 后面自动推断. 可不写类名
//CompassPoint.A

//3.3 枚举结合Switch
switch direct{case .North:    println("Lots of planets have a north")case .South:    println("Watch out for penguins")
case .East:    println("Where the sun rises")case .West:    println("Where the skies are blue")
default:
    println("OK")
}

////3.4 关联枚举. 关联变化的
enum Barcode{
    case UPCA(Int,Int,Int)  //关联了3个参数    case QRCode(String)    //关联了一个字符串
}
//
var productBarcode = Barcode.UPCA(0, 1, 2)   //这样使用, 关联了3个数.

//3.5 枚举原始值.
enum MyASCII : Character{   //定义类型了
    case Tab = "\t"
    case LineFeed = "\n"
}

enum Planet: Int {    case Mercury = 1, Venus, Earth, Mars, Jupite, Saturn, Uranus, Neptune
}
//使用toRaw方法可以访问枚举的原始值
println(Planet.Venus.toRaw())   //值为2, 这个自动递增
//使用fromRaw可找到原始的枚举成员
println(Planet.fromRaw(2))   //返回的是可选的类型, 意味着不一定存在

