import unittest, options, lists, macros, strutils, tables

proc convertToSeqString(cl:iterator: int {.closure.}): seq[string] =
  # simply writing cl() --> map($it) --> to(seq) does not work
  # see https://github.com/nim-lang/Nim/issues/7787
  result = @[]
  for it in cl():
    result.add($it)


suite "check closure":

  test "iterator":
    let a = @[1,2,3]

    iterator x_inline(): auto {.inline.} =
      for it0 in a:
        let it1 = it0
        yield it1
    
    iterator x(): type(x_inline()) {.closure.} =
      for it in x_inline():
        yield it

    check(convertToSeqString(x) == @["1", "2", "3"])
