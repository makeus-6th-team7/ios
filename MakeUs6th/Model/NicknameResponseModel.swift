//
//  NicknameResponseModel.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/04/22.
//

struct NicknameResponseModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
