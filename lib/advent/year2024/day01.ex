defmodule Advent.Year2024.Day01 do
  def part1(input) do
    {list_left, list_right} = input

    Enum.zip(
      Enum.sort(list_left),
      Enum.sort(list_right)
    )
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part2(input) do
    {list_left, list_right} = input

    list_right_counts = Enum.frequencies(list_right)

    Enum.reduce(list_left, 0, fn num, acc ->
      count = Map.get(list_right_counts, num, 0)
      acc + num * count
    end)
  end

  def parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      String.split(row)
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end
end
