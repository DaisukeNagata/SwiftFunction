//
//  MemoryUsage.swift
//  
//
//  Created by 永田大祐 on 2021/06/02.
//

import Foundation

public class MemoryUsage {

    var taskInfo = mach_task_basic_info()

    public func checkPointer() -> UnsafeMutablePointer<Int32>{

        var array: UnsafeMutablePointer<Int32>
        array = UnsafeMutablePointer<Int32>.allocate(capacity: Int(MemoryUsage().taskInfo.resident_size))
        array.deinitialize(count: Int(MemoryUsage().taskInfo.resident_size))
        return array
    }

    public func reportMemory()-> String {

        var taskInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {

            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }

        if kerr == KERN_SUCCESS {
            print("KERN_SUCCESS")
        } else {
            print("something")
        }
        return  "\(taskInfo.resident_size/1048576)"
    }
}
