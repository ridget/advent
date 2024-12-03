defmodule Advent.Year2024.Day03 do
  def part1(args) do
    parse_input(args)
    |> Enum.flat_map(&find_all_mul/1)
    |> multiply()
    |> Enum.sum()
  end

  def part2(args) do
    args
  end

  def parse_input(args) do
    args
    |> String.split("\n", trim: true)
  end

  def find_all_mul(string) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/
    matches = Regex.scan(regex, string)
  end

  def multiply(matches) do
    Enum.map(matches, fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
  end
end
