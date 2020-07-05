enum Scale {
    case celsius, fahrenheit

    func toCelsius(_ val: Double) -> Double {
        if self == .celsius {
            return val
        }
        return (val - 32.0) * 5.0/9.0
    }

    func toFahrenheit(_ val: Double) -> Double {
        if self == .fahrenheit {
            return val
        }
        return val * 9.0/5.0 + 32.0
    }
}

protocol Convertible {
    var celsius: Temperature { get }
    var fahrenheit: Temperature { get }
}

struct Temperature : Convertible {
    let scale: Scale
    let measurement: Double

    var celsius: Temperature {
        return scale.toCelsius(measurement).celsius
    }

    var fahrenheit: Temperature {
        return scale.toFahrenheit(measurement).fahrenheit
    }
}

extension Double : Convertible {
    func degreesCelsius() -> Temperature {
        return Temperature(scale: .celsius, measurement: self)
    }

    func degreesFahrenheit() -> Temperature {
        return Temperature(scale: .fahrenheit, measurement: self)
    }

    var celsius: Temperature {
        return self.degreesCelsius()
    }

    var fahrenheit: Temperature {
        return self.degreesFahrenheit()
    }
}

