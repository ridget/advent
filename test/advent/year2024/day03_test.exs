defmodule Advent.Year2024.Day03Test do
  use ExUnit.Case

  import Elixir.Advent.Year2024.Day03

  test "part1" do
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    result = part1(input)

    assert result == 161
  end

  test "part2" do
    input = """
      <why()!~/who(),mul(1,2)mul(2,2)^&mul(1,2)@@from()]<select(){do()['who()who()&]mul(1,2)~from(){}what()>mul(2,2){from(905,178);$/mul(1,2)$why()@don't()#why()#from()from()when(){mul(4,5)[^]/*what()!!mul(4,5)
    """

    result = part2(input)

    assert result == 16
  end
end
