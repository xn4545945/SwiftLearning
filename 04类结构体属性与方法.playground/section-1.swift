// Playground - noun: a place where people can play

import UIKit

//1.类与结构体. 两者差不了太多
/*
类与结构体有很多相同的地方: (第2,3点是其他语言中不存在的)
1)都可以定义属性/方法/下标(结构体也可以定义方法了)
2)都能初始化(通过构造方法)
3)都能使用扩展(extension)与协议(protocol)
4)类与结构体(枚举)中的全局属性/方法: 在类中用class关键字, 但在结构体中用static

类比结构体多的功能:
1)能继承
2)运行时能检查类对象的类型
3)析构释放资源
4)引用计数允许一个类实例有多个引用
*/
class Person1{
    var name = "jack"
//    class var height:Int = 10   //错误! 类中不能有全局存储属性的, 只能是计算属性. 见下文说明
}

struct Person2{   //结构体更像Java中的类
    var age:Int
//    static var height:Int = 10  //可以设定全局属性, 需要初始化.
}

//1.1实例化类与结构, 默认构造器
let p1 = Person1()
let p2 = Person2(age: 10)  //当使用默认构造器时, 必须初始化里面所有的属性

//=======================================================================

//2.属性(存储属性--计算属性--类属性)
//2.1存储属性: 就是存储一个常量或变量, 类似Java中的成员变量
class Person3{
    var name:String = "xuneng"  //需要手动初始化
    var age:Int = 10
    let height = 175
    lazy var p1:Person1 = Person1() //延迟, 必须是var
}

var p3 = Person3()
p3.name   //通过点语法来访问
p3.age = 11   //设置

//延迟lazy存储属性: 当使用改属性时才进行初始化, 好处是避免空间浪费
println(p3.p1)   //这句调用时, p1才进行初始化

//2.2计算属性: 不直接存储值, 而是用get/set来做. 可用来操作其他属性值的变化
//get: 取, 用来封装取值的过程
//set: 设, 用来封装设值的过程
class Person4{
    var name:String = "jack"
    var jjLength:Int = 10
    var age:Int{  //只能是var
        get{
            return jjLength * 2
        }
        set(newAge){
            jjLength = newAge / 2
        }
    }
}
var p4 = Person4()
p4.age = 10   //当设age为10时,jjLength变为5


//2.2.1 简便的计算属性写法
//默认参数newValue, 表示新赋给的值
class Person5{
    //用newValue
    var jjLength:Int = 10
    var age:Int{  //只能是var
        get{
            return jjLength * 2
        }
        set{
            jjLength = newValue / 2
        }
    }
    
    //只读计算属性
    var height:Int{
        get{
            return jjLength * 4
        }
    }
    
    var height2:Int{  //只读直接可以省略get
        return jjLength * 4
    }
}

var p5 = Person5()
p5.height
//p5.height = 10  //只读的不能赋值

//2.2.2 注意计算属性的死循环情况
//计算属性的值是不固定的,因此不能用let修饰, 只能用var
//计算属性不能直接赋值
class Person6{
    //用newValue
    var jjLength:Int = 10
    
//    var height2:Int = 10{  //不能直接赋值, 否则成存储属性了
//        return jjLength * 4
//    }
    
    var age:Int{
        get{
            return age   //死循环.  age会调用get方法
        }
        set{
           age = newValue    //死循环.  age设值时会调用set方法
        }
    }
}

//2.3 类属性(或者叫做类型属性) 用class关键字修饰. 类属性只能是计算属性.
//类属性就是类似java中static修饰的属性. 一个类只有一份,且多个实例对象共享.可直接用类名调用
class Person7{
    class var name:String{
        return "xuneng"
    }
}
Person7.name

//2.4 属性监视器: 可用来监视属性变化的2个方法willSet, didSet
//计算属性因为有get和set方法, 因此监视器其实对计算属性没多大用处. 对存储属性用处大
//初始化值时, 不会调用willSet与didSet
//willSet, didSet和set, get不能共存
class Person8{
    var name:String = "xuneng"{
        willSet{
            println("新值为:\(newValue)")    //newValue新值
        }
        didSet{
            println("新值为:\(oldValue)")   //oldValue表示旧值
        }
    }
}
var p8 = Person8()
p8.name = "jack"    //这句调用

//=======================================================================

//3.方法. 对象方法(用对象调用), 类方法(只能用类名调用)
//3.1 对象方法
//类中的方法与函数的一点区别: 方法的第一个参数以后,全是外部参数. 名字即为参数名
class Person9{
    func sum(num1:Int , num2:Int){
        println(num1 + num2)
    }
}
var p9 = Person9()
p9.sum(10, num2: 10)  //第一个参数以后, 全是外部参数. 相当于加了#

//3.2 类方法. 用class修饰
class Person10{
    class func sum(num1:Int , num2:Int){
        println(num1 + num2)
    }
}
Person10.sum(10, num2: 10)

//3.3 self与super, 与OC相同
class Person11{
    func sum(num1:Int , num2:Int){
        self.fun()   //对象方法调用对象方法, 类方法调用类方法
    }
    
    func fun(){
        println("hello")
    }
}

//=======================================================================
//4.下标,有的叫附属脚本(subscript)
//可以定义在 类/结构体/枚举中, 进行快速访问.

//格式：也可以设定set/get
/*
subscript(index:Int) -> Int{
    get{
        
    }
    set{
        
    }
}
*/
struct Person12{   //官方很多用的结构体
    let jjLength:Int      //结构体在这里可以不初始化
    
    subscript(index:Int) -> Int{
        return jjLength * index
    }
}

var p12 = Person12(jjLength: 10)
p12[3]     //直接想访问数组一样访问.  根据jj长度,index为3,值为30

