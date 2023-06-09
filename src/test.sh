#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  /src/main "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 1 1
assert 256 256
assert 21 "5+20-4"

echo OK
