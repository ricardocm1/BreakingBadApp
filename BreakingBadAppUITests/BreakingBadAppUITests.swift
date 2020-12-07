//
//  BreakingBadAppUITests.swift
//  BreakingBadAppUITests
//
//  Created by Ricardo Carra Marsilio on 04/11/20.
//

import XCTest

class BreakingBadAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    
    func testTabBar() throws {
        
         app = XCUIApplication()
        app.launch()
    
        let tabBar = app.tabBars["Tab Bar"].buttons["film"]
        
        let firstCell = app.tables.cells["Episode:, Pilot, Release date:, 01-20-2008,   Season:, 1"].staticTexts["Episode:"]
        
        if tabBar.isSelected {
            XCTAssertTrue(firstCell.exists)
        }
    }
    
    func testCell() throws {
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()
        
        let tableButton = app.tables/*@START_MENU_TOKEN@*/.buttons["Walter White\nA.K.A. Heisenberg\nPresumed dead"]/*[[".cells[\"Walter White\\nA.K.A. Heisenberg\\nPresumed dead\"].buttons[\"Walter White\\nA.K.A. Heisenberg\\nPresumed dead\"]",".buttons[\"Walter White\\nA.K.A. Heisenberg\\nPresumed dead\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        
        let ocupationLabel = app.staticTexts["High School Chemistry Teacher"]
        
        if tableButton.isSelected {
            XCTAssertTrue(ocupationLabel.exists)
        }
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
