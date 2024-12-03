defmodule Advent.Year2024.Day03 do
  def part1(args) do
    args
    |> parse_input()
    |> Enum.flat_map(&find_all_mul/1)
    |> multiply()
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> parse_input()
    |> Enum.reduce({true, []}, fn line, {mul_enabled, results} ->
      {new_mul_enabled, new_results} = multiply_with_logic(line, mul_enabled)
      {new_mul_enabled, results ++ new_results}
    end)
    |> elem(1)
    |> Enum.sum()
  end

  def parse_input(args) do
    args
    |> String.split("\n", trim: true)
  end

  def find_all_mul(string) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/
    Regex.scan(regex, string)
  end

  def multiply(matches) do
    Enum.map(matches, fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
  end

  def multiply_with_logic(input, mul_enabled) do
    mul_pattern = ~r/mul\((\d{1,3}),(\d{1,3})\)/
    do_pattern = ~r/do\(\s*\)/
    dont_pattern = ~r/don't\(\s*\)/

    input
    |> String.split(~r/(do\(\s*\)|don't\(\s*\)|mul\((\d{1,3}),(\d{1,3})\))/,
      include_captures: true
    )
    |> Enum.reduce({mul_enabled, []}, fn token, {mul_enabled, results} ->
      cond do
        Regex.match?(do_pattern, token) ->
          {true, results}

        Regex.match?(dont_pattern, token) ->
          {false, results}

        mul_enabled and Regex.match?(mul_pattern, token) ->
          [_, a, b] = Regex.run(mul_pattern, token)
          {mul_enabled, results ++ [String.to_integer(a) * String.to_integer(b)]}

        true ->
          {mul_enabled, results}
      end
    end)
  end
end
