assert = require "assert"
render = require "../"

describe "renderAppcacheManifest", ->

  it "renders an appcache manfiest with cache, network, and fallback", ->
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
    assert.equal(actual.indexOf("# Math.random() == "), -1)

  it "renders a unique appcache manfiest", ->
    actual = render
      cache: ["a","b","c","bar","buzz"]
      network: ["*","*/*"]
      unique: yes
    assert.notEqual(actual.indexOf("# Math.random() == "), -1)