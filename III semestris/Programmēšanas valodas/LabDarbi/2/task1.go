// 241RDB360, Iaroslav Viazmitin
package main

import (
	"fmt"
	"strings"
)

func main(){
	var first_word string = "";
	fmt.Print("First word: ");
	fmt.Scan(&first_word)
	var second_word string = "";
	fmt.Print("Second word: ");
	fmt.Scan(&second_word);
	var fw_charset map[byte]int = getCharMap(strings.ToLower(first_word))
	var sw_charset map[byte]int = getCharMap(strings.ToLower(second_word))
	if checkMapEquality(fw_charset, sw_charset){
		fmt.Println("YES")
		return
	}
	fmt.Println("NO")
}

func getCharMap(word string) map[byte]int{
	var charSet = map[byte]int{}; 
	for i:=0; i<len(word); i++ {
		if _, ok := charSet[word[i]]; !ok {
			charSet[word[i]] = 1
		} else {
			charSet[word[i]]++ 
		}
	}
	return charSet
}

func checkMapEquality(map_one map[byte]int, map_two map[byte]int) bool{
	if len(map_one) != len(map_two) {
		return false
	}
	for key, value := range map_one{
		if _, ok := map_two[key]; !ok {
			return false
		} else {
			if value != map_two[key] {
				return false
			}
		}
	}
	return true
}