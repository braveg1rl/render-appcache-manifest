assert = require "assert"
render = require "../"

describe "renderAppcacheManifest", ->

  it "renders an appcache manfiest", ->
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
    actual = render
      cache: ["a","b","c","bar","buzz"]
      network: ["*","*/*"]
      fallback:
        foo: "bar"
        fizz: "buzz"
    assert.equal expected, actual
