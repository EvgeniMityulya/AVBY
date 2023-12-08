//
//  Car.swift
//  AVBY
//
//  Created by Евгений Митюля on 12/6/23.
//

import Foundation

struct Car {
    let name: String
    let releaseYear: Int
    let milieage: Int
    let capacity: Double
    let priceDollars: Double
    var priceRubles: Double {
        priceDollars * 3.5
    }
    let bodyType: BodyType
    let engineType: EngineType
    let imageName: String
    let announcementStatus: [AnnouncementStatus]
    let city: String
    let date: String
    let sellStatus: SellStatus
    let about: String
    
    
    static let cars: [Car] = [
        Car(name: "Nissan Silvia S15 Рестайлинг",
            releaseYear: 2003,
            milieage: 250_000,
            capacity: 3.5,
            priceDollars: 20_000.7,
            bodyType: .coupe,
            engineType: .diesel,
            imageName: "car0",
            announcementStatus: [.top],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .leasing,
            about: """
                   Nissan Silvia S15 Рестайлинг - это стильный купе с мощным дизельным двигателем.
                   Он был выпущен в 2003 году и имеет пробег 250,000 миль.
                   Этот автомобиль оборудован системой ABS и багажником.
                   Это идеальный выбор для тех, кто ищет надежное и быстрое средство передвижения.
                   """
           ),
        
        Car(name: "Toyota Camry",
            releaseYear: 2019,
            milieage: 30_000,
            capacity: 2.5,
            priceDollars: 25_000.0,
            bodyType: .sedan,
            engineType: .gasoline,
            imageName: "car1",
            announcementStatus: [.top, .vin],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Toyota Camry"),
        
        Car(name: "Honda CR-V",
            releaseYear: 2018,
            milieage: 40_000,
            capacity: 2.4,
            priceDollars: 22_500.5,
            bodyType: .suv,
            engineType: .hybrid,
            imageName: "car2",
            announcementStatus: [.top, .vin],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Honda CR-V"),
        
        Car(name: "Audi A5 Sportback",
            releaseYear: 2021,
            milieage: 5_000,
            capacity: 2.0,
            priceDollars: 45_000.8,
            bodyType: .coupe,
            engineType: .gasoline,
            imageName: "car3",
            announcementStatus: [.top, .vin],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Audi A5 Sportback"),
        
        Car(name: "Tesla Model 3",
            releaseYear: 2022,
            milieage: 1_000,
            capacity: 0.0,
            priceDollars: 50_000.0,
            bodyType: .sedan,
            engineType: .electric,
            imageName: "car4",
            announcementStatus: [.top, .vin],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Tesla Model 3")
    ]
}

