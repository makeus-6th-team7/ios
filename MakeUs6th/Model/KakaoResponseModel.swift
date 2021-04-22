//
//  KakaoResponseModel.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/04/22.
//

struct KakaoResponseModel: Decodable {
    var code: Int
    var message: String
    var isSuccess: Bool
    var result: SignInResult?
}

struct SignInResult: Decodable {
    var userIdx: Int
    var jwt: String
    var newUser : Bool
}

