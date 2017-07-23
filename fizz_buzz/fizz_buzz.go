package main

import "fmt"
import "log"
import "bufio"
import "os"
import "strings"
import "strconv"

func main() {
    file, err := os.Open(os.Args[1])
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := scanner.Text()
        parts := strings.Split(line, " ")
        div1, _ := strconv.Atoi(parts[0])
        div2, _ := strconv.Atoi(parts[1])
        lmax, _ := strconv.Atoi(parts[2])

        for n := 1; n <= lmax; n++ {
            if (n % div1 == 0) && (n % div2 == 0) {
              fmt.Printf("%v", "FB")
            } else if n % div2 == 0 {
              fmt.Printf("%v", "B")
            } else if n % div1 == 0 {
              fmt.Printf("%v", "F")
            } else {
              fmt.Printf("%v", n)
            }

            if n < lmax {
                fmt.Printf("%v", " ")
            }
        }
        fmt.Printf("%v", "\n")
    }
}