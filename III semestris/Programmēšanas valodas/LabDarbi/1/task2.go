package main

import (
	"fmt"
	"os"
	"strconv"
)

const ERROR_MESSAGE = "input-output error\n"

func main() {
	var text string
  // first set
  var firstSet int[];
  fmt.Println("First sequence of numbers")
  for var i int = 0;;i++{
    fmt.Print("Input number: ")
   	fmt.Scan(&text)
    if text == "0"{
      break;
    }
	   var number, err = strconv.ParseInt(arg, 10, 64)
	   if err == nil {
      firstSet[i] = number
    } else {
        fmt.Println(ERROR_MESSAGE)
    }
  }
  // second set
  var secondSet int[];
  fmt.Println("Second sequence of numbers")
  for var i int = 0;;i++{
    fmt.Print("Input number: ")
   	fmt.Scan(&text)
    if text == "0"{
      break;
    }
	   var number, err = strconv.ParseInt(arg, 10, 64)
	   if err == nil {
      firstSet[i] = number
    } else {
        fmt.Println(ERROR_MESSAGE)
    }
  }
  // a \setminus b
  fmt.print("Result: ")
  for var i int = 0; i < firstSet.length(); i++{
      for var j int = 0; j < secondSet.length(); j++{
          if firstSet[i] == secondSet[j]{
              fmt.print(firstSet[i])
              fmt.print(" ")
          }
      }
  }
}