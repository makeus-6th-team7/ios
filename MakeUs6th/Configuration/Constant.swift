//
//  Constant.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/03/04.
//

import Alamofire
import Foundation

struct Constant {
    static let BASE_URL = "http://52.79.187.77"
    static var HEADERS : HTTPHeaders = ["jwt" :  "\(String(describing: Token.jwt!))"]
}
