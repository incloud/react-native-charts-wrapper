import Foundation
import Charts
import SwiftyJSON

class BackgroundRangeUtils {
  static func getBackgroundRanges(_ config: NSArray) -> [BackgroundRange] {
    var ranges : [BackgroundRange] = []
    for object in config {
      if let dict = object as? NSDictionary {
        let json = BridgeUtils.toJson(dict)
        if json["color"].int != nil && json["lowerThreshold"].double != nil && json["higherThreshold"].double != nil {
          var range = BackgroundRange(color: RCTConvert.uiColor(json["color"].intValue), lowerThreshold: CGFloat(json["lowerThreshold"].floatValue), higherThreshold: CGFloat(json["higherThreshold"].floatValue))
          ranges.append(range)
        }
      }
    }
    return ranges
  }
}
