import UIKit
//=====================================================================
//1.方法第一个参数变化. 在swift 3.0里使用方法里参数的lable来完成说明方法功能的作用。
//https://github.com/apple/swift-evolution/blob/master/proposals/0046-first-label.md
// 第一句是 Swift 2 语法，第二句是 Swift 3 语法

"mystring".writeToFile("filename.txt", atomically: true, encoding: NSUTF8StringEncoding)
"mystring".write(toFile: "filename.txt", atomically: true, encoding:NSUTF8StringEncoding)


UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
UIFont.preferredFont(forTextStyle: UIFontTextStyleSubheadline)

override func numberOfSectionsInTableView(tableView: UITableView) -> Int
override func numberOfSections(in tableView: UITableView) -> Int

func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
func viewForZooming(in scrollView: UIScrollView) -> UIView?

NSTimer.scheduledTimerWithTimeInterval(0.35, target: self, selector: #selector(reset), userInfo: nil, repeats: true)
Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(reset), userInfo: nil, repeats: true)


//=====================================================================
//2.简化一些方法的写法. 去除不必要的词.
//https://github.com/apple/swift-evolution/blob/master/proposals/0005-objective-c-name-translation.md
// 第一句是 Swift 2 语法，第二句是 Swift 3 语法

let blue = UIColor.blueColor()
let blue = UIColor.blue()

let min = numbers.minElement()
let min = numbers.min()

attributedString.appendAttributedString(anotherString)
attributedString.append(anotherString)

names.insert("Jane", atIndex: 0)
names.insert("Jane", at: 0)

UIDevice.currentDevice()
UIDevice.current()


//=====================================================================
//3.新的GCD写法
// Swift 2 语法
let queue = dispatch_queue_create("com.test.myqueue", nil)
dispatch_async(queue) {
    print("Hello World")
}

// Swift 3 语法
let queue = DispatchQueue(label: "com.test.myqueue")
queue.async {
    print("Hello World")
}


//=====================================================================
//4.新的Core Graphics写法
//https://github.com/apple/swift-evolution/blob/master/proposals/0044-import-as-member.md
// Swift 2 语法
let ctx = UIGraphicsGetCurrentContext()
let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
CGContextSetFillColorWithColor(ctx, UIColor.blueColor().CGColor)
CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
CGContextSetLineWidth(ctx, 10)
CGContextAddRect(ctx, rectangle)
CGContextDrawPath(ctx, .FillStroke)
UIGraphicsEndImageContext()

// Swift 3 语法
if let ctx = UIGraphicsGetCurrentContext() {
    let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
    ctx.setFillColor(UIColor.blue().cgColor)
    ctx.setStrokeColor(UIColor.white().cgColor)
    ctx.setLineWidth(10)
    ctx.addRect(rectangle)
    ctx.drawPath(using: .fillStroke)
    
    UIGraphicsEndImageContext()
}


//=====================================================================
//5.枚举中 case 值的大小写: 枚举中定义的 case 值现在使用小驼峰命名法。这是为了和属性名或者变量名保持一致.

// 第一句是 Swift 2 语法，第二句是 Swift 3 语法
UIInterfaceOrientationMask.Landscape
UIInterfaceOrientationMask.landscape

NSTextAlignment.Right
NSTextAlignment.right

SKBlendMode.Multiply
SKBlendMode.multiply


//=====================================================================
//6.方法名为动词,名词的区别.
//https://github.com/apple/swift-evolution/blob/master/proposals/0006-apply-api-guidelines-to-the-standard-library.md
//如果这个方法名中包含“ed”或“ing”后缀，则表明这是一个名词。方法名为名词的方法有返回值。
//如果不包含这些后缀，则很可能这是一个动词。以动词命名的方法会对某块引用的内存进行一些操作。即所谓的“修改某个值”。

customArray.enumerate()     //内存中对原数组操作.
customArray.enumerated()    //不改变原数组,有返回值.

customArray.reverse()
customArray.reversed()

customArray.sort() // changed from .sortInPlace()
customArray.sorted()


//=====================================================================
//7.函数在声明和调用时，都需要用括号将参数括住.
//https://github.com/apple/swift-evolution/blob/master/proposals/0066-standardize-function-type-syntax.md
func f(a: Int) {}

// Swift 2 语法
Int -> Float
String -> Int
T -> U
Int -> Float -> String

// Swift 3 语法
(Int) -> Float
(String) -> Int
(T) -> U
(Int) -> (Float) -> String

//=====================================================================
//8.去除NS前缀
//https://github.com/apple/swift-evolution/blob/master/proposals/0086-drop-foundation-ns.md
var url1:NSURL
var url2:URL

var data1:NSData
var data2:Data

//=====================================================================
//9.++ --不能用了
var i=0
i++   //推荐替换为i+=1
i--



