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
    
    public func forInstanceAction<I>(instance: [I]) {
        for index in instance {
            print(index)
        }
    }

    public func forEnumerated<I>(instance: [I]) {
        for (i,v) in instance.enumerated() {
            print(i)
            print(v)
        }
    }
}
