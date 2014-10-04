// Playground - noun: a place where people can play

import UIKit

//1.扩展 extension(类似OC中的分类, 但Swift中没有名字), 即使在没有权限获取到原始代码的情况下, 为类增加新功能.
//注意: 只要定义了扩展, 那么该扩展对该类的实例都是可用的.
/*
extension SomeType{
    //添加到SomeType的新功能写在这里
}
*/

//1.1扩展属性(只能是计算属性)
//扩展可以添加新计算属性, 但是不能添加存储属性(也不可以添加属性观察).
extension Double{  //为API中的已有类型添加实例属性
    var km : Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm : Double { return self / 100.0 }
}

let jjLength = 1.m  // 1与m进行点运算, 表示1的Double值
let jjLength_km = 1.km
println(10.km + 1.m)

//1.2扩展构造器
//可以定制自己的构造器
class MyClass{
    var a : Int
    init(){
        a = 10
    }
}

extension MyClass{
    convenience init(var parm:Int){   //扩展构造器
        self.init()
        println("扩展构造器--->遍历构造器, \(parm)")
    }
}

var myClass = MyClass(parm: 9)

//1.3扩展方法
//下面是像Int中扩展myIntFunc方法
extension Int{
    func myIntFunc(){
        println("值为\(self) , 哈哈哈哈!")
    }
}

1.myIntFunc()

//1.3.1 修改实例方法
//通过扩展方法, 可以修改该实例self本身. 但是方法前要加 mutating
/*
extension Double{
    mutating func myMoidfySelfValue{
        self = self * self //修改self实例的值
    }
}

var d = 2.0
d.myMoidfySelfValue()
*/

//1.4 扩展嵌套类型.即向已有的嵌套类型中添加新的嵌套类型. 还可以扩展下标(附属脚本)等.
extension Character {
    enum Kind{   //嵌套了一个枚举类型
        case Big
        case Small
    }
    var k : Kind{
        if(String(self).lowercaseString == "a"){
            return Kind.Big
        }else{
            return Kind.Small
        }
    }
}
var ch : Character = "a"
ch.k   //返回一个枚举值Kind.Big

//==========================================================================

//2.协议 protocol
//可定义方法与属性, 由具体的类去实现. 越来越像Java
//Swift中的协议能被类, 枚举, 结构体实现.
protocol SomeProtocol{
    //协议内容
}

class SomeClass : SomeProtocol{ //实现协议, 可实现多个协议
    
}

//2.1 协议中属性/方法/突变方法的要求
//2.1.1 属性的要求: 实例/类属性, 访问权限等.
protocol AnotherProtocol1{
    //class表示类成员(结构体/枚举中用static)
    class var property : Int { get set} //get, set 表示可读可写
}

class AnotherClass1 : AnotherProtocol1{
    class var property : Int {  //实现协议中的属性
        get{
            return 10
        }
        set{
            
        }
    }
}

//2.1.2 方法要求
//不支持默认参数. 写法上只是没有方法的实现.
protocol AnotherProtocol2{
    func myFunc() -> Int   //只声明不实现
}

class AnotherClass2 : AnotherProtocol2{
    func myFunc() -> Int {  //实现方法
        return 10
    }
}

//2.1.3 突变方法要求
//能在方法或函数内部改变实例类型的方法称为突变方法. (mutating关键字)
//在类中,可以不写mutating, 但在结构体与枚举中国必须写
protocol Togg{
    mutating func togg()
}

enum OnOffSwitch : Togg{
    case Off , On
    
    mutating func togg() { //改变实例的值
        switch self{
        case .Off:
            self = On
        case .On:
            self = Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.togg()   //值变为On


//2.2 协议类型.
//协议也可以当做类型来使用. 这点和函数一样.
//1.可作为参数/返回值类型
//2.可作为常量/变量/属性的类型
//3.可作为数组/字典和其他元素类型
protocol MyRect{
    func myLuckNumber() -> Int
}

class MyRectImp : MyRect{
    func myLuckNumber() -> Int {
        return 10
    }
}

class Dice {
    let sides :Int
    var gener : MyRect    //作为类型
    init(sides:Int, gener:MyRect){  //作为参数
        self.sides = sides
        self.gener = gener
    }
}

var dice = Dice(sides: 6, gener: MyRectImp())
dice.gener.myLuckNumber()   //返回10
