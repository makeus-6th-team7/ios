//
//  SetNicknameDataManager.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/04/22.
//

import Alamofire

class SetNicknameDataManager {
    /*
     - parameter : NicknameInputModel
     - header에 jwt token 불러옴 (Token.jwt <- userdefaults)
     - reponse decode , encode model : NicknameResponseModel
     */
    func postNickname(_ parameters: NicknameInputModel, viewController: SetNameViewController) {
        AF.request("\(Constant.BASE_URL)/users/id", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: NicknameResponseModel.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        //성공시, vc내 성공 func 호출 및 실행
                        viewController.didSuccess()
                    } else if response.code == 2011 {
                        // 중복 코드 : 중복일 경우, 중복 경고 label 보여주기
                        viewController.repeatAlert.isHidden = false
                    } else {
                        
                    }
                    //print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    // 서버 연결 실패시, vc내 fail msg func 호출 (parm : )
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
