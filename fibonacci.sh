#!/bin/bash

fib_cache=(0 1)

fib ()
{
    local n=$1
    while [ ${#fib_cache[@]} -lt $n ]; do
        fib_cache+=($(bc <<< "${fib_cache[-1]} + ${fib_cache[-2]}"))
    done
    echo ${fib_cache[@]:0:$n}
}

fib_tests ()
{
    output=fibonacci_actual.out
    > $output
    test()
    {
        local n=$1
        echo "$n -> $(fib $n)" >>$output
    }
    test 1
    test 2
    test 3
    test 4
    test 5
    test 6
    test 7
    test 8
    test 9
    test 10
    test 11
    test 12
    test 13
    test 99
    test 201
    
    diff -y fibonacci_expected.out $output
}