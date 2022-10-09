import UIKit

var greeting = "Hello, playground"


//closures practise.

//closure Systax

//{ (Parameter)->returnType in
//
//    // body
//}

let add:(Int,Int)->Int = { (value1,value2) in
    
    return value1+value2
    
}


print("the added clousre value is \(add(4,5))")

//Closure is anonymous function.Explanations.

func sortNum(a:Int,b:Int)->Bool
{
    return a<b
}

var num=[2,6,4,5]

//num.sorted(by: sortNum)

//using sortNum func as closure.

num.sorted(by:{(a:Int,b:Int)->Bool in return a<b})






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
