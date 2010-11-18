############################################################
# wrong

require 'minitest/bench/minitest'

def wrong_header type
  ['require "minitest/autorun"',
  'require "wrong"',
  "",
  "class TestWrong#{type.capitalize} < MiniTest::Unit::TestCase",
  "  include Wrong::Assert",
  "  def setup",
  "    @x = rand 1",
  "  end"].join("\n")
end

def wrong_test type
  {
    "positive" => "assert { @x == 0 }",
    "negative" => "assert { @x == 1 }",
  }[type] or raise "unknown type: #{type.inspect}"
end

def wrong_testcase n, type
  ["  def test_#{"%04d" % n}",
   "    #{wrong_test type}",
   "  end"].join("\n")
end

def wrong_footer
  "end"
end

$frameworks << "wrong"
