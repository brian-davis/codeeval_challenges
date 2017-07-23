package main

import(
  "fmt"
)

func main() {
  var primes []int
  n := 2
  for len(primes) < 1000 {
    is_prime := true

    for m := 2; m <= n / 2; m++ {
      if n % m == 0 {
        is_prime = false
      }
    }

    if is_prime {
      primes = append(primes, n)
    }

    n += 1
  }

  sum := 0
  for i := 0; i < len(primes); i++ {
    sum += primes[i]
  }

  // fmt.Printf("primes: %v\n", primes)
  // fmt.Printf("length: %v\n", len(primes))
  // fmt.Printf("sum: %v\n", sum)
  fmt.Printf("%v", sum)
}