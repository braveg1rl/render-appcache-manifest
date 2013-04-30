assert = require "assert"
render = require "../"

expected = """
CACHE MANIFEST

a
b
c
bar
buzz

NETWORK:
*
*/*

FALLBACK:
foo bar
fizz buzz
"""

describe "renderAppcacheManifest", ->
  it "renders an appcache manfiest", ->
    assert.equal expected, render
      cache: ["a","b","c","bar","buzz"]
      network: ["*","*/*"]
      fallback:
        foo: "bar"
        fizz: "buzz"