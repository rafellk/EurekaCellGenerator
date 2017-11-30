#!/usr/bin/swift

import Foundation

let arguments = CommandLine.arguments

func checkArguments() -> Bool {
    if arguments.count > 1 {
        let firstArgument = arguments[1]
        switch(firstArgument) {
        case "Help", "help":
            print("""

                Using if there is a defined path to the file:
                    ./scriptname.swift cellName path

                Using you want to create a file in the current path:
                    ./scriptname.swift cellName

            """)
            return false
            
        default:
            break
        }
    } else {
        print("""

            Wrong number of arguments. Open help assistant to see more.

        """)
        
        return false
    }
    
    return true
}

/**
 * Method that generates
 */
func createClassFile(fileName: String, path: String?) {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "MM/dd/YYYY"
    
    let now = Date()
    let nowFormatted = dateFormat.string(from: now)
    
    // The base Eureka row and cell classes based on the provided class name
    let classContent = """
    //
    //  \(fileName).swift
    //
    //  Created by script on \(nowFormatted).
    //  Copyright © 2017. All rights reserved.
    //
    
    import UIKit
    import Eureka
    
    struct \(fileName)Model: Equatable {
    
        static func ==(lhs: \(fileName)Model, rhs: \(fileName)Model) -> Bool {
            // all models must implement this method
            return false
        }
    }
    
    final class \(fileName)Row: Row<\(fileName)>, RowType {
        required public init(tag: String?) {
            super.init(tag: tag)
            cellProvider = CellProvider<\(fileName)>(nibName: "\(fileName)")
        }
    }
    
    class \(fileName): Cell<\(fileName)Model>, CellType {
    }
    """
    
    let classData = classContent.data(using: String.Encoding.utf8)
    let finalPath = "\(path ?? "")/\(fileName).swift"
    
    FileManager.default.createFile(atPath: finalPath, contents: classData, attributes: nil)
    print("Generated \(finalPath)")
}

func createNibFile(fileName: String, path: String?) {
    // Empty xib content binded with the class name provided
    let xibContent = """
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="13142" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
        <dependencies>
            <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="12042"/>
            <capability name="Safe area layout guides" minToolsVersion="9.0"/>
            <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
        </dependencies>
        <objects>
            <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner"/>
            <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
            <tableViewCell contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" id="KGk-i7-Jjw" customClass="\(fileName)" customModuleProvider="target">
                <rect key="frame" x="0.0" y="0.0" width="320" height="44"/>
                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                <tableViewCellContentView key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" tableViewCell="KGk-i7-Jjw" id="H2p-sc-9uM">
                    <rect key="frame" x="0.0" y="0.0" width="320" height="43"/>
                    <autoresizingMask key="autoresizingMask"/>
                </tableViewCellContentView>
                <viewLayoutGuide key="safeArea" id="njF-e1-oar"/>
            </tableViewCell>
    </objects>
    </document>
    """
    
    let xibData = xibContent.data(using: String.Encoding.utf8)
    let finalPath = "\(path ?? "")/\(fileName).xib"
    
    FileManager.default.createFile(atPath: finalPath, contents: xibData, attributes: nil)
    print("Generated \(finalPath)")
}

// Main execution
if checkArguments() {
    print("Starting to generate code...")
    var secondArgument = ""
    
    if arguments.count > 2 {
        secondArgument = arguments[2]
    }
    createClassFile(fileName: arguments[1], path: secondArgument)
    createNibFile(fileName: arguments[1], path: secondArgument)
}


