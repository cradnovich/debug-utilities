//
//  StringExtensions.swift
//  
//
//  Created by Meir Radnovich on 15 Kislev 5781.
//

import Foundation

extension String
{
  static let numberyCharacters = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: ",. "))
  
  public var d: Data
  {
    return data(using: .utf8) ?? Data()
  }
  
  public func partitioned(every stride: Int) -> [Substring]
  {
    var result: [Substring] = []
    let resultLength = (count / stride) + 1
    
    for i in 0...resultLength
    {
      guard let chunkStart = index(startIndex, offsetBy: i * stride, limitedBy: endIndex) else
      {
        break
      }
      
      let substr: Substring
      
      if let chunkEnd = index(chunkStart, offsetBy: stride, limitedBy: endIndex)
      {
        substr = self[chunkStart..<chunkEnd]
      }
      else
      {
        substr = self[chunkStart...]
      }
      
      if substr.isEmpty
      {
        break
      }
      
      result.append(substr)
    }
    
    return result
  }
  
  public func range(from nsrange: NSRange) -> Range<String.Index>
  {
    let rangeStart: String.Index
    
    if let s = index(startIndex, offsetBy: nsrange.location, limitedBy: endIndex)
    {
      rangeStart = s
    }
    else
    {
      rangeStart = startIndex
    }
    
    let rangeEnd: String.Index
    if let e = index(rangeStart, offsetBy: nsrange.length, limitedBy: endIndex)
    {
      rangeEnd = e
    }
    else
    {
      rangeEnd = endIndex
    }
    
    return rangeStart..<rangeEnd
  }
  
  public func substring(with nsrange: NSRange) -> Substring
  {
    return self[range(from: nsrange)]
  }
  
  public var numeric: String
  {
    return String(unicodeScalars: unicodeScalars.filter({ String.numberyCharacters.contains($0) }))
  }
  
  public var doubleValue: Double?
  {
    return Double(self)
  }
  
  public var intValue: Int?
  {
    return Int(self)
  }
  
  public init<S: Sequence>(unicodeScalars ucs: S) where S.Iterator.Element == UnicodeScalar
  {
    var s = ""
    s.unicodeScalars.append(contentsOf: ucs)
    self = s
  }
}
