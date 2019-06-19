
import Foundation

struct LastProjects: Decodable {
  let projects: [LastProject]
  private enum CodingKeys: String, CodingKey {
    case projects
  }
}
struct LastProject: Decodable {
  let projectId: String
  let projectTitle: String
  let title: String
  let shortDescr: String
  let subscribeNum: Int
  let purchaseNum: Int
  let followNum: Int
  let popularRanking: Double
  let typeId: String
  let typeName: String
  let projectImage: String
  let status: String
  let offers: Offers
  let owner: Owner
  let visualizedUrl: String
  let linkUrl: String
  private enum CodingKeys: String, CodingKey {
    case projectId = "project_id"
    case projectTitle = "project_title"
    case title
    case shortDescr = "short_descr"
    case subscribeNum = "subscribe_num"
    case purchaseNum = "purchase_num"
    case followNum = "follow_num"
    case popularRanking = "popular_ranking"
    case typeId = "type_id"
    case typeName = "type_name"
    case projectImage = "project_image"
    case status
    case offers
    case owner
    case visualizedUrl = "visualized_url"
    case linkUrl = "link_url"
  }
}
struct Offers: Decodable {
  let min: Int
  let max: Int
  private enum CodingKeys: String, CodingKey {
    case min
    case max
  }
}
