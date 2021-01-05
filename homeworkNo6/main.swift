//
//  main.swift
//  homeworkNo6
//
//  Created by Maksim Kjaulakis on 02.01.2021.
//

import Foundation

protocol Numerable {
    var vehicleNum: String { get  }
    var brand: String { get  }
}

class Car: Numerable {
    
    let brand: String
    let vehicleNum: String
    
    init(brand: String, vehicleNum: String) {
        self.brand = brand
        self.vehicleNum = vehicleNum
    }
}

class Bus: Numerable {
    let brand: String
    let vehicleNum: String
    let seatCount: Int
    
    init(brand: String, vehicleNum: String, seatCount: Int) {
        self.brand = brand
        self.vehicleNum = vehicleNum
        self.seatCount = seatCount
    }
}

class Truck: Numerable {
    let brand: String
    let vehicleNum: String
    let capacity: Int
    
    init(brand: String, vehicleNum: String, capacity: Int) {
        self.brand = brand
        self.vehicleNum = vehicleNum
        self.capacity = capacity
    }
}

struct Queue<T: Numerable> {
    var carWash: [T] = []
    
    mutating func push(_ vehicle: T) {
        carWash.append(vehicle)
    }
    mutating func pop() -> T? {
        return carWash.isEmpty ? .none : carWash.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        var string: String = ""
        for vehicle in carWash {
            string += "\(vehicle.brand) \(vehicle.vehicleNum), "
        }
        if string.isEmpty {
            return "Очередь пустая"
        } else {
            return string
        }
    }
}

var carQueue = Queue<Car>()
carQueue.push(Car(brand: "honda", vehicleNum: "675haf"))
carQueue.push(Car(brand: "toyota", vehicleNum: "563kln"))
carQueue.push(Car(brand: "audi", vehicleNum: "123buf"))
print(carQueue)

let car1 = carQueue.pop()
print(carQueue)
let car2 = carQueue.pop()
print(carQueue)
let car3 = carQueue.pop()
print(carQueue)

var busQueue = Queue<Bus>()
busQueue.push(Bus(brand: "volvo", vehicleNum: "667aao", seatCount: 35))
busQueue.push(Bus(brand: "scania", vehicleNum: "890ipo", seatCount: 28))
print(busQueue)

let bus1 = busQueue.pop()
print(busQueue)
let bus2 = busQueue.pop()
print(busQueue)

var truckQueue = Queue<Truck>()
truckQueue.push(Truck(brand: "scania", vehicleNum: "321uuu", capacity: 400000))
truckQueue.push(Truck(brand: "man", vehicleNum: "444yrt", capacity: 450000))
print(truckQueue)

let truck1 = truckQueue.pop()
print(truckQueue)
let truck2 = truckQueue.pop()
print(truckQueue)



func filterNumbers(array: [Int], checkfunktion: (Int) -> Bool) -> [Int] {
    var myArrey: [Int] = []
    
    for element in array {
        if checkfunktion(element) {
           myArrey.append(element)
        }
    }
    return myArrey
}

let array = Array(1...20)
print(array)

let lessNumbers = filterNumbers(array: array) { $0 <= 10 }
print(lessNumbers)

let moreNumbers = filterNumbers(array: array) { $0 > 10 }
print(moreNumbers)



