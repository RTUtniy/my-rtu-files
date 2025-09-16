// 241RBG360, Iaroslav Viazmitin
package main

import (
	"fmt"
	"os"
	"strconv"
)

const ERROR_MESSAGE = "input-output error\n"

func main() {
	var argsExist bool = len(os.Args) > 1
	if argsExist {
		// importing args
		for i := 1; i < len(os.Args); i++ {
			numberValidation(os.Args[i])
		}
	} else {
		// reading from cli
		var text string
		fmt.Print("Input number: ")
		fmt.Scan(&text)
		numberValidation(text)
	}
}

func numberValidation(arg string) {
	var number, err = strconv.ParseInt(arg, 10, 64)
	if err == nil {
		if number < 2 {
			fmt.Println(ERROR_MESSAGE)
		} else {
			fmt.Print(arg, ": ")
			primenumberfactorization(int(number))
		}
	} else {
		fmt.Print(ERROR_MESSAGE)
	}
}

func primenumberfactorization(number int) {
	var primefactor int = 1
	//fmt.Println()
	for index := 2; index <= number; index++ {
		//fmt.Println(number, index, number%index)
		if number % index == 0 {
			primefactor = index
			break
		} else {
			primefactor = number
		}
	}
	fmt.Print(primefactor, " ")
	if (number != primefactor){
		primenumberfactorization(number / primefactor)
	} else {
		fmt.Println()
	}
}
