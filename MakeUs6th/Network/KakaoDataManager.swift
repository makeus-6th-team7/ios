//
//  KakaoDataManager.swift
//  MakeUs6th
//
//  Created by miori Lee on 2021/04/22.
//

import Alamofire

class KakaoDataManager {
    func postSignIn(_ parameters: KakaoInputModel, viewController: FirstViewController) {
        AF.request("\(Constant.BASE_URL)/users/log-in/kakao", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: KakaoResponseModel.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        viewController.didSuccessSignIn(result)
                    } else {
                        print("에러메세지")
                        print(response.code) //2004
                            /*
                         유효하지 않은 토큰 오류
                         */
                        print(Token.kakaoAccessToken)
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
