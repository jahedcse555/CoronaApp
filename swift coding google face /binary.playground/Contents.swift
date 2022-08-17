

func binarySearch<T: Comparable>(array: [T], key: T, range: Range<Int>) -> Int? {
  if range.lowerBound >= range.upperBound {
    return nil
  } else {
    let midIndex = (range.upperBound + range.lowerBound) / 2
    if array[midIndex] > key {
      return binarySearch(array: array, key: key, range: range.lowerBound ..< midIndex)
    } else if array[midIndex] < key {
      return binarySearch(array: array, key: key, range: midIndex + 1 ..< range.upperBound)
    } else {
      return midIndex
    }
  }
}

// How to use:
let array = [11, 17, 19, 25, 27, 32, 10, 10, 43, 55]
binarySearch(array: array, key: 10, range: 0 ..< array.count)
