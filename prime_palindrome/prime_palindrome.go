package main

import (
  "fmt"
  "strconv"
  "strings"
)

func main() {
    prime_palindrome := 1
    for n := 1; n <= 1000; n++ {
      is_prime := true
      for m := 2; m <= n / 2; m++ {
        if n % m == 0 {
          is_prime = false
        }
      }
      if is_prime {
        // fmt.Printf("%v\n", n)
        primestr := strconv.Itoa(n)
        chars := strings.Split(primestr, "")
        chars_len := len(chars)
        reverse_chars := make([]string, chars_len)

        for i := 0; i <= chars_len - 1; i++ {
          reverse_chars[chars_len - i - 1] = chars[i]
        }

        slices_equal := true
        for i := 0; i <= chars_len - 1; i++ {
          if chars[i] != reverse_chars[i] {
            slices_equal = false
          }
        }
        if slices_equal {
          prime_palindrome = n
        }
      }
    }

   fmt.Printf("%v\n", prime_palindrome)
}