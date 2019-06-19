import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa
import RxCocoa_Texture
let disposeBag = DisposeBag()
//let vc = UIViewController()
//vc.view.backgroundColor = UIColor.white
//PlaygroundPage.current.liveView = vc
let iso8601JSONDecoder : JSONDecoder = {
  let j = JSONDecoder()
  j.dateDecodingStrategy = .iso8601
  return j
}()
let resetSuccessPasswordData = """
{"data":{"member_id":"65A0C19B9CDBC5BD3EAEF51AEA27A9F4","username":null,"nickname":"Amulin","head_photo":null,"access_token":"17b8e28c3d672e0685cec5e8d08836be34c16922"},"message":"success","status":"success"}
""".data(using: .utf8)!

struct ResetPasswordResponse : Decodable {
  let userId: String
  let username: String?
  let nickname: String?
  let headPhoto: String?
  let accessToken: String
  enum CodingKeys: String, CodingKey {
    case userId = "member_id"
    case username = "username"
    case nickname = "nickname"
    case headPhoto = "head_photo"
    case accessToken = "access_token"
  }
}
//struct ApiResponse<T>: Decodable where T: Decodable{
//  var msg: String?
//  var status: String?
//  var data: T
//  enum CodingKeys: String, CodingKey {
//    case msg = "message"
//    case status = "status"
//    case data
//  }
//}
//typealias DataResponse = Response<Data>
//struct Response<T> {
//  let request: URLRequest?
//  let response: HTTPURLResponse?
//  /// Represent for the response value.
//  let value: T
//  let statusCode: Int
//  init(request: URLRequest?,
//       response: HTTPURLResponse?,
//       value: T,
//       statusCode: Int)
//  {
//    self.request = request
//    self.response = response
//    self.value = value
//    self.statusCode = statusCode
//  }
//}


struct MessageApiResonse<T> : Decodable where T: Decodable {
  let message: String?
  let data: T
  private enum CodingKeys : String, CodingKey {
    case message
    case data
  }
}
let myStruct = try JSONDecoder().decode(MessageApiResonse<ResetPasswordResponse>.self, from: resetSuccessPasswordData) // decoding our data
//print(myStruct) // decoded!
print(myStruct.data)


func foo(i: Int, with j: Int){
  print(i,j)
}
foo(i: 1, with: 2)
