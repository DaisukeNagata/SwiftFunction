import Foundation

public class ForAction: NSObject {
    public func forAction(start: Int, end: Int) {
        for i in start..<end {
            print(i)
        }
    }
    
    public func forEatchAction<I>(index: [I]) {
        index.forEach { i in
            print(i)
        }
    }
}
