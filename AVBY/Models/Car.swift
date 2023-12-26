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
    let imageName: [String]
    let equipment: [Equipment]
    let trade: Bool
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
            imageName: ["nissan1", "nissan2", "nissan3"],
            equipment: [.trunk, .freeLight],
            trade: true,
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
            imageName: ["toyota1", "toyota2", "toyota3"],
            equipment: [.abs, .freeLight],
            trade: true,
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
            imageName: ["honda1", "honda2", "honda3"],
            equipment: [.trunk, .abs],
            trade: false,
            announcementStatus: [],
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
            imageName: ["audi1", "audi2", "audi3"],
            equipment: [.heatedGrips, .freeLight],
            trade: true,
            announcementStatus: [.top],
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
            imageName: ["tesla1", "tesla2", "tesla3"],
            equipment: [.heatedGrips, .freeLight],
            trade: false,
            announcementStatus: [.vin],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Tesla Model 3"),
        
        Car(name: "BMW 3 Series",
            releaseYear: 2020,
            milieage: 15_000,
            capacity: 2.0,
            priceDollars: 40_000.0,
            bodyType: .sedan,
            engineType: .gasoline,
            imageName: ["bmw1", "bmw2", "bmw3"],
            equipment: [.abs, .freeLight],
            trade: true,
            announcementStatus: [.top],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .leasing,
            about: "Описание BMW 3 Series"),

        Car(name: "Mercedes-Benz GLC",
            releaseYear: 2017,
            milieage: 50_000,
            capacity: 3.0,
            priceDollars: 35_000.0,
            bodyType: .suv,
            engineType: .diesel,
            imageName: ["mercedes1", "mercedes2", "mercedes3"],
            equipment: [.trunk, .freeLight],
            trade: false,
            announcementStatus: [],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Mercedes-Benz GLC"),

        Car(name: "Chevrolet Corvette Stingray",
            releaseYear: 2022,
            milieage: 2_000,
            capacity: 6.2,
            priceDollars: 70_000.0,
            bodyType: .coupe,
            engineType: .gasoline,
            imageName: ["chevrolet1", "chevrolet2", "chevrolet3"],
            equipment: [.trunk, .freeLight],
            trade: true,
            announcementStatus: [.top, .vin],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Chevrolet Corvette Stingray"),

        Car(name: "Volkswagen Golf GTI",
            releaseYear: 2019,
            milieage: 25_000,
            capacity: 2.0,
            priceDollars: 30_000.0,
            bodyType: .sedan,
            engineType: .gasoline,
            imageName: ["volkswagen1", "volkswagen2", "volkswagen3"],
            equipment: [.abs, .heatedGrips],
            trade: true,
            announcementStatus: [],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .leasing,
            about: "Описание Volkswagen Golf GTI"),

        Car(name: "Subaru Outback",
            releaseYear: 2021,
            milieage: 12_000,
            capacity: 2.5,
            priceDollars: 38_000.0,
            bodyType: .sedan,
            engineType: .gasoline,
            imageName: ["subaru1", "subaru2", "subaru3"],
            equipment: [.abs, .trunk, .freeLight],
            trade: false,
            announcementStatus: [],
            city: "Минск",
            date: "31 декабря",
            sellStatus: .credit,
            about: "Описание Subaru Outback")
    ]
}

