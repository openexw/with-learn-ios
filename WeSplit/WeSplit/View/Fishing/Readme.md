# SwiftUI 标准库 SwiftUI Standard Library
找到开发者文档：Help->Developer Document

如获取一个整数的随机数：
- 找到 Swift
- 找到 Standard Library
- 找到 Int
- 搜索 random
```swift
for _ in 1...3 {
    print(Int.random(in: 1..<100)) // 生成 1-99 的随机数
}
// Prints "53"
// Prints "64"
// Prints "5"
```
# 单元测试 Unit Testing
1.  
2.  设置 setUpXXX 和 tearDown
3. 断言
4. 运行测试

```swift
import XCTest
@testable import WeSplit

final class GameTests: XCTestCase {

    var game: Game!
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testExample() throws {
        XCTAssertEqual(game?.points(val: 50), 99)
    }
}

```
# 测试趋动开发 Test-Driven Development

# 类型推断 Type Inference
