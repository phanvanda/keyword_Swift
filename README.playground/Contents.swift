//: Playground - noun: a place where people can play

import UIKit

// associatedtype: cho phép tạo một tên bất kì cho 1 loại biến trong khai báo của 1 protocol
protocol Entertaiment {
    associatedtype MediaType
}

class Foo: Entertaiment {
    typealias MediaType = String
}

// fileprivate: giới hạn trong 1 file, thường dùng cho extension

class Person {
    fileprivate var jobTitle: String = ""
}

extension Person {
    func printJobTitle() {
        print("\(jobTitle)")
    }
}

// private: dùng trong 1 scope

// subscript: cho phép xuất đến 1 thành biên nằm trong 1 collection,list, sequence
var postMetrics = ["Likes":422, "ReadPercentage":0.58, "Views":3409]
let postLikes = postMetrics["Likes"]

// typealias: cho phép đặt 1 tên khác của 1 kiểu sẵn có
typealias JSONDictionary = [String: AnyObject]
func parseJSON(_ deserializedData: JSONDictionary){}

//defer: sử dụng khi muốn đảm bảo thực thi 1 đoạn code nào đó ngay hàm kết thúc.
func test()
{
    defer
    {
        print("2") // thằng này print sau
    }
    print("1") // thằng này print trước
}
var a = test()
print(a)
// fallthrough: xét trên xuống, nếu khớp 1 case nào đó thì nó vẫn tiếp tục xét tiếp 1 case liền kề.

let box = 0
switch box
{
case 0:
    print(0) // In ra 0
    fallthrough
case 1:
    print(1) // In ra 1
case 2:
    print(2) // Không có được in ra
default:
    print("default")
}

//rethrow: 1 hàm ném ra 1 error nếu 1 tham số trong hàm ném ra 1 error.
func networkCall(onComplete:() throws -> Void) rethrows
{
    do
    {
        try onComplete()
    }
    catch
    {
        throw SomeError.error
    }
}

// throw:  hàm có thể ném ra 1 lỗi
// didSet : sau khi gán xong thì nó sẽ thực hiện câu lệnh bên trong didSet
var data = [1,2,3]
{
    didSet
    {
        tableView.reloadData()
    }
}

// convenience:
// willSet: thì được gọi ngay trước khi biến được gán đâu đó. Nó có newValue là giá trị sẽ được gán đó.
class Person
{
    var name:String?
    {
        willSet(newValue) {print("I've got a new name, it's \(newValue)!")}
    }
}
let aPerson = Person()
aPerson.name = "Jordan" //Prints out "I've got a new name, it's Jordan!" right before name is assigned to
