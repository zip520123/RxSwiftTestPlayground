import UIKit
import AsyncDisplayKit
import PlaygroundSupport

class ASVC: ASViewController<ASDisplayNode> {
  let tView : TView
  init() {
    tView = TView()
    super.init(node: ASDisplayNode())
    self.node.addSubnode(tView)
    self.node.layoutSpecBlock = { [weak self] node, constrainedSize in
      guard let cNode = self?.tView else {return ASLayoutSpec() }
      return ASCenterLayoutSpec(centeringOptions: ASCenterLayoutSpecCenteringOptions.XY, sizingOptions: .minimumXY, child: cNode)
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.orange
  }
}
//let vc = ASVC(tViewType: TView.self)
let vc = ASVC()
PlaygroundPage.current.liveView = vc

class TView: ASDisplayNode {
  let userNode = ASTextNode()
  let postNode = ASTextNode()
  let timeNode = ASTextNode()

  let node = ASDisplayNode()

  override required init() {
    super.init()
    automaticallyManagesSubnodes = true
    backgroundColor = UIColor.white

    node.backgroundColor = .orange
    node.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

    userNode.attributedText = NSAttributedString(string: "userNode")
    postNode.attributedText = NSAttributedString(string: "postNode")
    timeNode.attributedText = NSAttributedString(string: "timeNode")
  }
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let vS = ASStackLayoutSpec.vertical()
    vS.children = [userNode, postNode, timeNode]

    let hStackSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 40, justifyContent: .start, alignItems: .center, children: [vS, node])
    return ASInsetLayoutSpec(insets: .zero, child: hStackSpec)
  }
}
