
package main

import "fmt"
import "log"
import "bufio"
import "os"
import "strings"

func main() {
    file, err := os.Open(os.Args[1])
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line  := scanner.Text()
        // fmt.Println(line)
        parts := strings.Split(line, " ")
        parts_len := len(parts)
        reverse_parts := make([]string, parts_len)

        for i := 0; i <= parts_len - 1; i++ {
          reverse_parts[parts_len - i - 1] = parts[i]
        }

        result := strings.Join(reverse_parts, " ")
        fmt.Println(result)
    }
}
