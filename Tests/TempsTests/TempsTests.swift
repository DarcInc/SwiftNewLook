import XCTest
@testable import Temps

final class TempsTests: XCTestCase {
    func simpleTemperature() {
        let t = Temperature(scale: .fahrenheit, measurement: 32.0)

        XCTAssertEqual(.fahrenheit, t.scale)
        XCTAssertEqual(32.0, t.measurement)
    }

    func doubleToTemperature() {
        let t1 = 32.0.degreesCelsius()
        let t2 = 32.0.degreesFahrenheit()

        XCTAssertEqual(.celsius, t1.scale)
        XCTAssertEqual(32.0, t1.measurement)

        XCTAssertEqual(.fahrenheit, t2.scale)
        XCTAssertEqual(32.0, t2.measurement)
    }

    func doublePropertiesToTemperature() {
        let t1 = 32.0.celsius
        let t2 = 32.0.fahrenheit

        XCTAssertEqual(.celsius, t1.scale)
        XCTAssertEqual(32.0, t1.measurement)

        XCTAssertEqual(.fahrenheit, t2.scale)
        XCTAssertEqual(32.0, t2.measurement)
    }

    func scaleConversions() {
        let f = Scale.celsius.toFahrenheit(0.0)
        let c = Scale.fahrenheit.toCelsius(212.0)
        
        XCTAssertEqual(32.0, f)
        XCTAssertEqual(100.0, c)
    }

    func scaleDontConvert() {
        let f = Scale.fahrenheit.toFahrenheit(0.0)
        let c = Scale.celsius.toCelsius(212.0)
        
        XCTAssertEqual(0.0, f)
        XCTAssertEqual(212.0, c)
    }

    func temperatureConvert() {
        let t1 = 0.0.celsius
        let t2 = 212.0.fahrenheit

        let t1Converted = t1.fahrenheit
        let t2Converted = t2.celsius

        XCTAssertEqual(32.0, t1Converted.measurement)
        XCTAssertEqual(.fahrenheit, t1Converted.scale)

        XCTAssertEqual(100.0, t2Converted.measurement)
        XCTAssertEqual(.celsius, t2Converted.scale)
    }

    func notATest() {
        let someRandomReadings: [Convertible] = [32.0, 40.0.celsius, 22.0, 55.0.fahrenheit]
        for reading in someRandomReadings {
            print(reading.celsius)
        }
    }

    static var allTests = [
        ("notATest", notATest),
        ("temperatureConvert", temperatureConvert),
        ("scaleDontConvert", scaleDontConvert),
        ("scaleConversions", scaleConversions),
        ("doublePropertiesToTemperature", doublePropertiesToTemperature),
        ("doubleToTemperature", doubleToTemperature),
        ("simpleTemperature", simpleTemperature),
    ]
}
