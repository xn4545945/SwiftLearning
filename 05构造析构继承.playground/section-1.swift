// Playground - noun: a place where people can play

import UIKit

//1. 继承与重写, 防止重写
//1.1 基类, 不继承任何类. Swift不想OC或者Java中继承自Object类. 定义一个类, 不继承任何类,该类就是基类.
class Person1{   //这个Person1就是基类
    func eat(){
        println("eat a pig!")
    }
}

//1.2 继承. Swift为单继承
class XiaoMing1 : Person1{
    var name = "xiaoming"
}

//1.3 重写. 必须加关键字override. (OC,Java中是不必加的)
class XiaoHong1 : Person1{
    override func eat() {
        super.eat();  //可以用super来调用父类中的属性与方法
        println("xiaohong eat a pig")
    }
}

var xh = XiaoHong1()
xh.eat()

//1.4 重写属性(存储属性与计算属性)
//可以用get/set/willSet/didSet进行属性重写
//可以将一个只读属性重写为一个读写属性
//不可以将一个读写属性重写为一个只读属性
//也就是说: 重写的范围只能是 小-->大 (类似Java)
//子类重写父类的属性时, 不管父类是计算属性还是存储属性, 重写的过程就是重写其中的get/set等, 子类的override都是计算属性的格式
class Person2{
    var name:String{ //计算属性
        set{
            println("Person2 set")
        }
        get{
            return "Person2"
        }
    }
    
    let age: Int = 10  //常量存储属性
    
    var height:Int = 175  //变量存储属性
}

class XiaoMing2 : Person2{
    override var name:String{
        set{
            super.name = newValue  //将父类的值设置为新值
            println("XiaoMing2 set")
        }
        get{
            return "XiaoMing2"
        }
    }

    override var age : Int{   //如果父属性是var的话, 必须有get和set
        get{
            println(super.age)
            return 20
        }
    }
    
    override var height :Int{  //重写观察属性: 继承来的常量存储属性,只读计算属性不能添加观察器.
        didSet{  //注意有didSet,willSet的地方是不能出现get/set的
            println("didset----\(oldValue)")
        }
        willSet{
            println("willSet----\(newValue)")
        }
    }
}

var xm2 = XiaoMing2()
xm2.name = "XM2"
println(xm2.age)
xm2.height = 10

//1.5 防止重写(final). 与Java一样
//可将final写在属性/方法/类等前面
class Person3{
    final var name = "Person3"
}

class XiaoMing3{
    //override var name ...//这样会报错
}

//===============================================================
//2.构造器
//Swift中的构造器无返回值(OC中是返回id的), 它的主要任务是保证新实例在第一次使用前完成正确的初始化工作.
//init() , 可以重载
//2.1 默认构造器与带参数构造器, 继承器的重载
class Person4{
    var name : String  //必须初始化, 或者在构造函数中初始化
    //默认, 不带参数
    init(){  //无返回值
        name = "xuneng"
    }
    
    //带参数
    init(name :String){  //默认是以参数名作为外部参数名的
        self.name = name + "Hello"  //和OC中相同, 用self.(Java中用this)
    }
    
    //带可选参数. 可选类型: 可以为空,也可以以后赋值. 初始化为nil
    var age:Int = 10
    init(name :String , age:Int?){
        self.name = name
        self.age = age!   //可选参数必须确定有(加!号)才能赋值
    }
    
}

var p4 = Person4()  //默认就是没有括号的
var p4_1 = Person4(name: "xn4545945 ")  //参数名作为外部参数名
var p4_2 = Person4(name: "neng", age: 10)

//2.1 指定构造器(Designated initializer)与便利构造器(convenience initializer)
//两种构造器, 确保所有类型都能获得初始值
//2.1.1 指定构造器: 每个类必须至少有一个, 用来确保所有值都进行初始化.(会根据父类的继承关系往上调用,完成父类的初始化)

//Person4中的3个构造器都是指定构造器, 都需要进行所有成员变量的初始化

//2.1.2 便利构造器(加convenience关键字): 辅助性的构造器. 可以用来同一个类中的指定构造器, 也可以用来创建一个有特定输入的实例
class Person5{
    var name : String  //必须初始化, 或者在指定构造函数中初始化
    
    init(name :String){ //指定构造器
        self.name = name + "Hello"
    }
    
    convenience init(name :String , height:Int){  //便利构造器. 不需要全部初始化成员变量
        self.init(name:name)
        println(height)
    }
}

var p5 = Person5(name: "xn4545945", height: 175)

//2.2 构造器链(概念): 规范指定构造器与便利构造器间的调用关系.
//1) 规则1: 指定构造器必须调用其父类的指定构造器
//2) 规则2: 便利构造器必须调用同一类中调用的其他构造器
//3) 规则3: 便利构造器必须以调用一个指定构造器结束
//一句话总结上面3个规律: 指定构造器是向上调用的, 便利构造器是横向调用的.

//2.3 两段式构造过程 (概念)
//第一个阶段：每个存储型属性通过引入它们的类的构造器来设置初始值。
//第二阶阶段：当每一个存储型属性值被确定后,二阶段开始,它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。
//两段式构造过程的使用让构造过程更安全,同时在整个类层级结构中给予了每个类完全的灵活性
//Swift 的两段式构造过程跟 Objective-C 中的构造过程类似。最主要的区别在于阶段 1,Objective-C 给每一个属性赋值 0 或空值(比如说 0 或 nil)。Swift 的构造流程则更加灵活,它允许你设置定制的初始值,并自如应对某些属性不能以 0 或 nil 作为合法默认值的情况。



//2.4 构造器的继承(概念)
//与OC不同, Swift中子类不会默认继承父类的构造器. (但如果满足以下2个条件会自动继承)
//1)如果子类没有定义指定构造器, 那么他将主动继承父类的
//2)如果子类提供了所有父类指定构造器的实现, 那么自动继承父类的便利构造器
class Father{
    init(){
        println("father init")
    }
    convenience init(name:String){
        self.init();
        println("father convenience init")
    }
}

class Son:Father{
    override init(){ //子类实现了父类的全部指定构造器, 因而会自动继承父类的便利构造器
        println("son init")
    }
}

var son1 = Son()
var son2 = Son(name: "xuneng")  //自动继承了父类的便利构造器

//2.5 通过闭包和函数来设置属性的默认值
//1)如果某个存储属性的值需要特别定制, 则可以使用闭包或全局函数类提供默认值.
//2)当类型创建时, 闭包或函数会被调用,他们的返回值会被当做默认值赋值给这个存储属性.
//3)使用闭包时, 实例的其他部分并没有初始化, 因而不能在闭包里面访问:其他实例属性/self属性/实例方法等.
//闭包的一般格式
class SomeClass{
    let someProperty : Int = { //整个花括号表示一个闭包
        return 0
    }() //这个小括号不能丢, 表示立即执行闭包. 并返回值.
}

class Person6{
    let name : String = {//可以在闭包里面做一些复杂的初始化工作
        let firstName = "xu"
        let lastName = "neng"
        return firstName + lastName
    }()
}

var p6 = Person6()
println(p6.name)

//===============================================================
//3.析构(反初始化) deinit
//在一个类实例被释放之前, 反初始化函数被立即调用
//Swift通过ARC来处理实例的内存管理, 与OC一样.
//每个类只有一个反初始化函数, 不带任何参数. 且不允许主动调用.
//子类继承了父类的反初始化函数(释放顺序类似Java. 先释放子类-->父类)
//反初始化话方法能访问该实例的所有属性
class Person7{
    var myMoney:Int
    init(){
        myMoney = 10
    }
    deinit{
        myMoney = 0   //可以访问类中的变量. 但这句没用. 因为销毁了,成员变量即不存在了
        //可以做一些清理工作
    }
}

var p:Person7? = Person7()
println(p!.myMoney)
p = nil   //可选类型才能设置为nil
//p!.myMoney   //错误, 已设置为nil

