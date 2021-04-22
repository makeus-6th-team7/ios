//
//  SetNicknameDataManager.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/04/22.
//

import Alamofire

class SetNicknameDataManager {
    func postNickname(_ parameters: NicknameInputModel, viewController: SetNameViewController) {
        AF.request("\(Constant.BASE_URL)/users/id", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: NicknameResponseModel.self) { response in
                switch response.result {
                /*
                 case .success(let response):
                     if response.isSuccess, let result = response.result {
                         viewController.didSuccessSignIn(result)
                     } else {
                         viewController.failedToRequest(message: response.message)
                     }
                 */
                case .success(let response):
                    if response.isSuccess {
                        viewController.didSuccess()
                    } else if response.code == 2011 {
                        viewController.repeatAlert.isHidden = false
                    } else {
                        
                    }
                    //print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
