//: [Previous](@previous)

import Foundation

let data = """
{
"data": {
"sliders": [
{
"slider_id": "678CB1AF4F9D109CBF05EAEE8690661E",
"slider_title": "book",
"slider_desc": "",
"display": "y",
"slider_link": "https://app-staging.pressplay.cc/index/redirect/?current=https%3A%2F%2Fapp-staging.pressplay.cc123&id=678CB1AF4F9D109CBF05EAEE8690661E",
"slider_img": "https://app-staging.pressplay.cc/static/uploads/index/20190401/BEFF90BE55236C148DA7331FD261ACB5/5ca192f01be42BEFF90BE55236C148DA7331FD261ACB520190401.jpg",
"slider_video": null,
"sort": 1,
"click_count": 2
},
{
"slider_id": "D425D883AF779540A61CEAED54FADB93",
"slider_title": "老王愛說笑：領先掌握全球財經脈動",
"slider_desc": "每日一篇午報，輕鬆看懂台股主流與國際趨勢",
"display": "y",
"slider_link": "https://app-staging.pressplay.cc/index/redirect/?current=https%3A%2F%2Fapp-staging.pressplay.cc%2Flink%2FD3C893C8&id=D425D883AF779540A61CEAED54FADB93",
"slider_img": "https://app-staging.pressplay.cc/static/uploads/index/20190219/B5F7C6EF1951242BCD0035B43BB0E6D5/5c6b9724e1ea4B5F7C6EF1951242BCD0035B43BB0E6D520190219.jpg",
"slider_video": null,
"sort": 1,
"click_count": 4249
},
{
"slider_id": "CF933BBDF4FADF1BDA92F3DA2ACB58CE",
"slider_title": " ",
"slider_desc": " ",
"display": "y",
"slider_link": "https://app-staging.pressplay.cc/index/redirect/?current=https%3A%2F%2Fapp-staging.pressplay.cc%2Flink%2F2667DB1B&id=CF933BBDF4FADF1BDA92F3DA2ACB58CE",
"slider_img": "https://app-staging.pressplay.cc/static/uploads/index/20180910/B5F7C6EF1951242BCD0035B43BB0E6D5/5b95fc433c6bfB5F7C6EF1951242BCD0035B43BB0E6D520180910.jpg",
"slider_video": null,
"sort": 2,
"click_count": 1623
},
{
"slider_id": "A465B6397C664D55AF08E598DE813DF8",
"slider_title": "",
"slider_desc": "",
"display": "y",
"slider_link": "https://app-staging.pressplay.cc/index/redirect/?current=https%3A%2F%2Fapp-staging.pressplay.cc%2Flink%2F3FEDC289&id=A465B6397C664D55AF08E598DE813DF8",
"slider_img": "https://app-staging.pressplay.cc/static/uploads/index/20181203/B5F7C6EF1951242BCD0035B43BB0E6D5/5c04e54eac1d4B5F7C6EF1951242BCD0035B43BB0E6D520181203.png",
"slider_video": null,
"sort": 3,
"click_count": 1630
},
{
"slider_id": "D7F7C13839448903062A48F61FB7DBD3",
"slider_title": "",
"slider_desc": "",
"display": "y",
"slider_link": "https://app-staging.pressplay.cc/index/redirect/?current=https%3A%2F%2Fapp-staging.pressplay.cc%2Flink%2F3A6CB388&id=D7F7C13839448903062A48F61FB7DBD3",
"slider_img": "https://app-staging.pressplay.cc/static/uploads/index/20190107/B5F7C6EF1951242BCD0035B43BB0E6D5/5c32d961e42beB5F7C6EF1951242BCD0035B43BB0E6D520190107.jpg",
"slider_video": null,
"sort": 4,
"click_count": 1331
},
{
"slider_id": "9C8890537B177A86162504D381744DB2",
"slider_title": "",
"slider_desc": "",
"display": "y",
"slider_link": "https://app-staging.pressplay.cc/index/redirect/?current=https%3A%2F%2Fapp-staging.pressplay.cc%2Flink%2F1AE4E128&id=9C8890537B177A86162504D381744DB2",
"slider_img": "https://app-staging.pressplay.cc/static/uploads/index/20181203/B5F7C6EF1951242BCD0035B43BB0E6D5/5c04e4ecad2b9B5F7C6EF1951242BCD0035B43BB0E6D520181203.jpg",
"slider_video": null,
"sort": 5,
"click_count": 1699
}
]
},
"message": "success",
"status": "success"
}
""".data(using: .utf8)!

struct MessageApiResonse<T> : Decodable where T: Decodable {
  let message: String?
  let data: T
  private enum CodingKeys : String, CodingKey {
    case message
    case data
  }
}
struct Sliders : Decodable {
  let sliders : [Slider]
  private enum CodingKeys: String, CodingKey {
    case sliders
  }
}
struct Slider : Decodable {
  let sliderId : String
  let title : String?
  let desc : String?
  let display : String?
  let link : String?
  let imageUrl : String?
  let videoUrl : String?
  let sort : Int?
  let clickCount : Int?
  private enum CodingKeys: String, CodingKey {
    case sliderId = "slider_id"
    case title = "slider_title"
    case desc = "slider_desc"
    case display
    case link = "slider_link"
    case imageUrl = "slider_img"
    case videoUrl = "slider_video"
    case sort
    case clickCount = "click_count"
  }
}
let myStruct = try JSONDecoder().decode(MessageApiResonse<Sliders>.self, from: data)
let sliders = myStruct.data
let slider = sliders.sliders[0]
print(slider.imageUrl)
