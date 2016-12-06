#!/usr/bin/env ruby
require 'test/unit'

def to_duration(r)
  (r or "").split(":").map {|e| e.to_i}[0,3].reverse
    .zip([1, 60, 3600]).map {|a, b| a * b}
    .reduce {|a, b| a + b} or 0
end

class Tests < Test::Unit::TestCase
  def test_nil
    assert_equal 0, to_duration(nil)
  end
  def test_emptry
    assert_equal 0, to_duration("")
  end
  def test_normal
    assert_equal                 0, to_duration("00:00:00")
    assert_equal                 1, to_duration("00:00:01")
    assert_equal                 2, to_duration("00:00:02")
    assert_equal          60*1 + 1, to_duration("00:01:01")
    assert_equal          60*2 + 1, to_duration("00:02:01")
    assert_equal 3600*1 + 60*2 + 1, to_duration("01:02:01")
  end
  def test_semi_normal
    assert_equal                 0, to_duration("00")
    assert_equal                 1, to_duration("01")
    assert_equal                 1, to_duration("00:01")
    assert_equal          60*1 + 2, to_duration("01:02")
    assert_equal                 0, to_duration("aa:bb:cc")
    assert_equal 3600*1 + 60*2 + 3, to_duration("01:02:03:04")  ## Ignore more than 3
  end
end
