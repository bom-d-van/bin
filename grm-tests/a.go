package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println("a")
	if len(os.Args) > 1 {
		fmt.Println("args:", strings.Join(os.Args[1:], " "))
	}
}
