// 241RDB360, Iaroslav Viazmitin
package main

import (
	"fmt"
	"strings"
)

func main(){
	var inputText = "";
	var synonymMap = map[string]string{};
	for ;true;{
		prompt := []string{"", "", ""};
		fmt.Scanf("%s", inputText);
		fmt.Println(inputText)
		prompt = strings.Split(inputText, " ")
		fmt.Println(prompt)
		if prompt[0] == "done" {
			goto end;
		} 
		if prompt[0] == "add" {
			for i := range prompt{
				fmt.Println(prompt[i])
			}
			if _, ok := synonymMap[prompt[1]]; !ok {
				synonymMap[prompt[1]] = prompt[2] // initialize
			} else {
				synonymMap[prompt[1]] = synonymMap[prompt[1]] + " " + prompt[2]
			}
		}
		if prompt[0] == "count"{
			if _, ok := synonymMap[prompt[1]]; !ok {
				fmt.Println("0")
			} else {
				fmt.Println(len(strings.Split(synonymMap[prompt[1]], ` `)))
			}
		}
		if prompt[0] == "check"{
			if _, ok := synonymMap[prompt[1]]; ok {
				var synonymList = strings.Split(synonymMap[prompt[1]], ` `)
				for synonymIndex := range synonymList{
					if synonymList[synonymIndex] == synonymMap[prompt[2]]{
						fmt.Println("Yes")
						goto check_end
					}
				}
			} else if _, ok := synonymMap[prompt[2]]; ok {
				var synonymList = strings.Split(synonymMap[prompt[2]], ` `)
				for synonymIndex := range synonymList{
					if synonymList[synonymIndex] == synonymMap[prompt[1]]{
						fmt.Println("Yes")
						goto check_end
					}
				}
			}
			fmt.Println("No")
			check_end: 
		}
	}
	end: return;
}