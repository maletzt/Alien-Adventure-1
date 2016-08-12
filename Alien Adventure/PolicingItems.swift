//
//  PolicingItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func policingItems(inventory: [UDItem], policingFilter: UDItem throws -> Void) -> [UDPolicingError:Int] {
        var errorCount: [UDPolicingError: Int] = [.NameContainsLaser:0, .ItemFromCunia:0, .ValueLessThan10:0]
        
        for item in inventory {
            do {
                try policingFilter(item)
                
            } catch UDPolicingError.NameContainsLaser {
                errorCount[.NameContainsLaser]! += 1
                
            } catch UDPolicingError.ItemFromCunia {
                errorCount[.ItemFromCunia]! += 1
                
            } catch UDPolicingError.ValueLessThan10 {
                errorCount[.ValueLessThan10]! += 1
                
            } catch {
            }
        }
        return errorCount
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 1"