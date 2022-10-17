import UIKit

var greeting = "Hello, playground"


//control Flow

//Swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code.


 let names=["mashk","great","Graham","Dear"]

for name in names{
    print("hello \(name)")
}

let numberOflegs=["cat":4,"hen":2,"spider":8,"ant":6]

for (animalName,legCount) in numberOflegs{
    print("\(animalName)s has \(legCount)")
}

for index in 1...5
{
    print("I am great personality.")
}
//closures practise.

//closure Systax

//{ (Parameter)->returnType in
//
//    // body
//}

let sayHello:()->Void={
    print("Hi,Hello")
}

sayHello()

let add:(Int,Int)->Int = { (value1,value2) in
    
    return value1+value2
    
}


print("the added clousre value is \(add(4,5))")

let squareDigit:(Int)->Int={
    
    $0*$0
    
}

squareDigit(5)

//Closure is anonymous function.Explanations.

func sortNum(a:Int,b:Int)->Bool
{
    return a<b
}

var num=[2,6,4,5]

//num.sorted(by: sortNum)

//using sortNum func as closure.

var numm=num.sorted(by:{(a:Int,b:Int)->Bool in return a<b})
print(numm)
numm=num.sorted(by:{ a,b in return a<b})

numm=num.sorted(by: {a,b in a<b})

numm=num.sorted(by: {$0<$1})

numm=num.sorted(by: <)




let numbers = [16, 58, 510]

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let strings=numbers.map { (number)-> String in
    
    var number=number
    var output=""
    
    repeat{
        
        output=digitNames[number%10]!+output
        number/=10
    }while number>0
    
    return output
    
    
}

print(strings)


//Enumerations definitions

//An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

//enum declarations

enum CompassPoint
{
    case north
    case south
    case east
    case west
   
}


//Multiple cases can appear on a single line, separated by commas:

enum Planet{
    case earth,mercury,venus,aster,jupiter
}


var headedToDirections=CompassPoint.north

headedToDirections = .south


switch headedToDirections
{
case .south:
             print("This is south")
case .north:
    print("THis is North")
case .east:
    print("This is east")
case .west:
    print("This is west")

}

//for enum, Switch statement must be exhaustive.or provide default case in switch statement.

var somePlanet = Planet.earth

switch somePlanet
{
case .earth:
    print("it is good for human life")
    
default:
    print("It is not good for human life.")
}


//Iterating over enum Cases.

enum Beverages:CaseIterable
{
  case coffee,tea,juice
}

let numberOfchoices = Beverages.allCases.count

print("Number of choices is is \(numberOfchoices)")

//Iterating over Beverages

for beverage in Beverages.allCases
{
    print(beverage)
}

var beveragesCollection = Beverages.allCases.map({"\($0)"}).joined(separator: ", ")
print(beveragesCollection)


//enum associated value example.

enum BarCode
{
    case upc(Int,Int,Int)
    case qrcode(String)
}

let productBarcode=BarCode.upc(4, 6, 99)

switch productBarcode
{
  case .upc(let numberSystem, let product, let manufacturer):
        print("UPC:\(numberSystem),\(product),\(manufacturer)")
    
  case .qrcode(let productCode):
    print("The product code is \(productCode)")
    
}


enum Planets:Int
{
    case earth,mars,venus,jupiter,mercury
}

var PlanetNumber=Planets.earth.rawValue

enum Directions:String
{
    case south = "Southhss"
    case North
    case East
    case west
}

var moveDirections = Directions.south.rawValue



//TypeCasting

//Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.

//Type casting in Swift is implemented with the is and as operators. These two operators provide a simple and expressive way to check the type of a value or cast a value to a different type.

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")





//protocol

//A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.


//Protocol Syntax

protocol SomeProtocol {
    // protocol definition goes here
}

//Protocol example1

protocol SomeProtocols {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//protocol example2


protocol fullyNamed
{
    var fullName:String {get}
}

struct Person:fullyNamed
{
    var fullName: String
}

let persnn=Person(fullName: "mashkk")

class StarShip:fullyNamed{
    
    var name: String
    var prefix:String?
    
    init(name:String,prefix:String? = nil)
    {
        self.name=name
        self.prefix=prefix
    }
    
    var fullName: String{
        return (prefix != nil ? prefix!+" " : "") + name
    }
}

var nc121=StarShip(name: "mashh", prefix: "USS")

//Method Requirements

protocol SomeProtocoll {
    static func someTypeMethod()
}


protocol togllable{
    mutating func toggle()
}

enum OnOffSwitch
{
    case on,off
    
    mutating func toggle()
    {
        switch self
        {
        case .on:
                self = .off
            
        case .off:
                self = .on
        }
    }
    
}

var toggleSwitch=OnOffSwitch.on
toggleSwitch.toggle()

//initializer in protocol

protocol SomeProtocolll {
    init(someParameter: Int)
}

//Class Implementations of Protocol Initializer Requirements
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

//Delegate example.

protocol callBackDelegate:AnyObject
{
    func callBack()
    
}

class A{
    
    weak var delegate:callBackDelegate?
    
    func callingDelegate()
    {
        print("initiating.....")
        delegate?.callBack()
       
    }
}

class B:callBackDelegate{
    
    func callBack() {
        
        print("Calling to delegate")
    }
}

let objA=A()
let objB=B()

objA.delegate=objB
objA.callingDelegate()



