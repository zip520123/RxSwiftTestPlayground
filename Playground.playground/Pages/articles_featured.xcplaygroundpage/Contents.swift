//: [Previous](@previous)

import Foundation

let testArticlesData = """
{
    "message": "success",
    "data": [
        {
            "project_id": "2667A183130728C4AE30928EF3CFF4DD",
            "timeline_key": "858268EFB8F0196B3E781F2BC3323144",
            "timeline_title": "「出租大叔」接單接不完，委託人都花錢聊什麼？",
            "timeline_desc": "每個人，都需要一個「聊聊後，可以繼續往前」的陪伴者。",
            "display_status": "y",
            "timeline_image": "https://app-staging.pressplay.cc/static/uploads/timeline_cover/20190313/BEFF90BE55236C148DA7331FD261ACB5/5c886a31166ccBEFF90BE55236C148DA7331FD261ACB520190313102553.jpg",
            "release_time": "2019-03-13T12:00:00+0800",
            "post_type": "public",
            "click_count": 580,
            "discuss_num": 0,
            "set_top": "n",
            "collections_count": 4,
            "project": {
                "project_id": "2667A183130728C4AE30928EF3CFF4DD",
                "project_title": "PressPlay 官方專欄",
                "type_id": "1253D7A4E325A3D03205A79DC59DDEB8",
                "member_id": "4CFEFA908E8F63F5B5C343848328FD4C",
                "project_head_photo": "https://app-staging.pressplay.cc/static/uploads/projectHead/20180905/4CFEFA908E8F63F5B5C343848328FD4C/5b8facafa4e4a4CFEFA908E8F63F5B5C343848328FD4C20180905.png",
                "owner": {
                    "member_id": "4CFEFA908E8F63F5B5C343848328FD4C",
                    "username": "PressPlay 內容團隊",
                    "nickname": "PressPlay 內容團隊"
                },
                "link_url": "https://app-staging.pressplay.cc/project/about/PressPlay%2B%E5%AE%98%E6%96%B9%E5%B0%88%E6%AC%84/2667A183130728C4AE30928EF3CFF4DD"
            },
            "attach_type": [
                "image"
            ],
            "is_collected": false,
            "cover_url": "https://app-staging.pressplay.cc/static/uploads/timeline_cover/20190313/BEFF90BE55236C148DA7331FD261ACB5/5c886a31166ccBEFF90BE55236C148DA7331FD261ACB520190313102553.jpg",
            "groups": [],
            "is_pinned": false,
            "link_url": "https://app-staging.pressplay.cc/project/vippPage/%E5%87%BA%E7%A7%9F%E5%A4%A7%E5%8F%94%E6%8E%A5%E5%96%AE%E6%8E%A5%E4%B8%8D%E5%AE%8C%E4%BA%BA%E7%94%9F%E5%B0%B1%E6%98%AF%E9%9C%80%E8%A6%81%E8%81%8A%E8%81%8A%E5%BE%8C%EF%BC%8C%E4%BD%A0%E5%8F%AF%E4%BB%A5%E7%B9%BC%E7%BA%8C%E5%BE%80%E5%89%8D%E7%9A%84%E9%99%AA%E4%BC%B4%E8%80%85/858268EFB8F0196B3E781F2BC3323144"
        },
        {
            "project_id": "FAB3025D350159D6F93086C9593382BA",
            "timeline_key": "2CD15344E5E0811AE3A1355C1E23FAB6",
            "timeline_title": "15檔長線黑馬股分享",
            "timeline_desc": "這15檔需要符合以下4個條件：1.具潛在報酬、2.關注不高、3.內部人不賣、4.主力不賣。",
            "display_status": "y",
            "timeline_image": "https://app-staging.pressplay.cc/static/uploads/timeline_cover/20190317/DA989F9BFFEB5D26DB0D963DD510A36B/5c8dc34275d74DA989F9BFFEB5D26DB0D963DD510A36B20190317114714.png",
            "release_time": "2019-03-17T12:35:09+0800",
            "post_type": "public",
            "click_count": 2449,
            "discuss_num": 0,
            "set_top": "n",
            "collections_count": 18,
            "project": {
                "project_id": "FAB3025D350159D6F93086C9593382BA",
                "project_title": "【不盯盤投資】: 教你挖出便宜潛力股",
                "type_id": "507CF74F93AD23B6584EF2C5D5D4430E",
                "member_id": "DA989F9BFFEB5D26DB0D963DD510A36B",
                "project_head_photo": "https://app-staging.pressplay.cc/static/uploads/project_head_photo/20190318/DA989F9BFFEB5D26DB0D963DD510A36B/5c8e72be88764DA989F9BFFEB5D26DB0D963DD510A36B20190318001558.jpg",
                "owner": {
                    "member_id": "DA989F9BFFEB5D26DB0D963DD510A36B",
                    "username": "王敬勳",
                    "nickname": "股人阿勳"
                },
                "link_url": "https://app-staging.pressplay.cc/project/about/%E4%B8%8D%E7%9B%AF%E7%9B%A4%E6%8A%95%E8%B3%87%2B%E6%95%99%E4%BD%A0%E6%8C%96%E5%87%BA%E4%BE%BF%E5%AE%9C%E6%BD%9B%E5%8A%9B%E8%82%A1/FAB3025D350159D6F93086C9593382BA"
            },
            "attach_type": [
                "image"
            ],
            "is_collected": false,
            "cover_url": "https://app-staging.pressplay.cc/static/uploads/timeline_cover/20190317/DA989F9BFFEB5D26DB0D963DD510A36B/5c8dc34275d74DA989F9BFFEB5D26DB0D963DD510A36B20190317114714.png",
            "groups": [],
            "is_pinned": false,
            "link_url": "https://app-staging.pressplay.cc/project/vippPage/%E6%B8%85%E5%96%AE%E5%88%86%E4%BA%AB%2B%E8%82%A1%E4%BA%BA%E9%81%B8%E8%82%A1%E9%95%B7%E7%B7%9A%E9%BB%91%E9%A6%AC%E8%82%A1/2CD15344E5E0811AE3A1355C1E23FAB6"
        },
        {
            "project_id": "2D6421835995EE2C8285F5645EBB8FAF",
            "timeline_key": "897BD697C89185A0B636C2B64F19E3BB",
            "timeline_title": "你的OKR跟我想的不一樣？",
            "timeline_desc": "近年來不少公司，對Google的成功及其管理方法OKR 非常的火熱\n\n\n\n自家電商公司也是棄KPI，",
            "display_status": "y",
            "timeline_image": "https://app-staging.pressplay.cc/static/uploads/timeline/20190221/D979F845DFF10AEA6B0F7284BD54BEEB/5c6ecaa9df35dD979F845DFF10AEA6B0F7284BD54BEEB20190221235833.png",
            "release_time": "2019-02-21T13:36:36+0800",
            "post_type": "public",
            "click_count": 50,
            "discuss_num": 0,
            "set_top": "n",
            "collections_count": 3,
            "project": {
                "project_id": "2D6421835995EE2C8285F5645EBB8FAF",
                "project_title": "從碼農到攻城獅 - 程序猿跟你想的不一樣",
                "type_id": "1253D7A4E325A3D03205A79DC59DDEB8",
                "member_id": "768D23109444F9E147A4A90E8B111C80",
                "project_head_photo": "https://app-staging.pressplay.cc/static/uploads/project_head_photo/20190126/768D23109444F9E147A4A90E8B111C80/5c4c001d541d2768D23109444F9E147A4A90E8B111C8020190126023717.png",
                "owner": {
                    "member_id": "768D23109444F9E147A4A90E8B111C80",
                    "username": "d",
                    "nickname": "攻城也有小編"
                },
                "link_url": "https://app-staging.pressplay.cc/project/about/%E5%BE%9E%E7%A2%BC%E8%BE%B2%E5%88%B0%E6%94%BB%E5%9F%8E%E7%8D%85%2B%2B%E7%A8%8B%E5%BA%8F%E7%8C%BF%E8%B7%9F%E4%BD%A0%E6%83%B3%E7%9A%84%E4%B8%8D%E4%B8%80%E6%A8%A3/2D6421835995EE2C8285F5645EBB8FAF"
            },
            "attach_type": [
                "image"
            ],
            "is_collected": false,
            "cover_url": "https://app-staging.pressplay.cc/static/uploads/timeline/20190221/D979F845DFF10AEA6B0F7284BD54BEEB/5c6ecaa9df35dD979F845DFF10AEA6B0F7284BD54BEEB20190221235833.png",
            "groups": [],
            "is_pinned": false,
            "link_url": "https://app-staging.pressplay.cc/project/vippPage/%E4%BD%A0%E7%9A%84OKR%E8%B7%9F%E6%88%91%E6%83%B3%E7%9A%84%E4%B8%8D%E4%B8%80%E6%A8%A3%EF%BC%9F/897BD697C89185A0B636C2B64F19E3BB"
        }
    ]
}
""".replacingOccurrences(of: "\n", with: "\\n").data(using: .utf8)!
struct MessageApiResonse<T> : Decodable where T: Decodable {
  let message: String?
  let data: T
  private enum CodingKeys : String, CodingKey {
    case message
    case data
  }
}
struct ArticlesFeaturedModel : Decodable {
  let projectId : String
  let timelineKey : String
  let timelineTitle : String
  private enum CodingKeys: String, CodingKey {
    case projectId = "project_id"
    case timelineKey = "timeline_key"
    case timelineTitle = "timeline_title"
  }
}
let model = try JSONDecoder().decode(MessageApiResonse<[ArticlesFeaturedModel]>.self, from: testArticlesData)
model.data[0].projectId

//: [Next](@next)
