defmodule Advent.Year2024.Day02 do
  def part1(args) do
    parse_input(args)
    |> all_decreasing_or_increasing()
    |> differ_by_at_least_one_and_at_most_three()
    |> length()
  end

  def part2(args) do
    reports = parse_input(args)

    reports
    |> Enum.filter(&safe?/1)
    |> length()
  end

  def parse_input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      String.split(row)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  def all_decreasing_or_increasing(reports) do
    Enum.filter(reports, &sorted?/1)
  end

  def differ_by_at_least_one_and_at_most_three(reports) do
    Enum.filter(reports, &level_adjaceny_valid/1)
  end

  def level_adjaceny_valid(levels) do
    levels
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.all?(fn [a, b] -> abs(a - b) in 1..3 end)
  end

  def sorted?(list) do
    list == Enum.sort(list) or list == Enum.sort(list, &>=/2)
  end

  def safe?(report) do
    (sorted?(report) and level_adjaceny_valid(report)) or
      Enum.any?(0..(length(report) - 1), fn i ->
        new_report = List.delete_at(report, i)
        sorted?(new_report) and level_adjaceny_valid(new_report)
      end)
  end
end
