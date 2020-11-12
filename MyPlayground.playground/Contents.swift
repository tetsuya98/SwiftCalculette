import UIKit

var str = "Hello, playground"

var f: (Double) -> Double = sqrt

func changeSign(_ value: Double) -> Double {
    return -value
}

f(81)
f = changeSign
f(81)
