package main

import (
  "fmt"
  "log"
  "bufio"
  "os"
  "strings"
  "strconv"
)

func main() {
    file, err := os.Open(os.Args[1])
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line  := scanner.Text()
        parts := strings.Split(line, ",")

        x, _ := strconv.Atoi(parts[0])
        n, _ := strconv.Atoi(parts[1])
        nv := n

        for n < x {
          n += nv
        }

        fmt.Printf("%v\n", n)
    }
}
