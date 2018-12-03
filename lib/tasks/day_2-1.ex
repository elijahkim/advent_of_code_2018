defmodule Mix.Tasks.Day2Puzzle1 do
  use Mix.Task

  def run(_) do
    File.stream!("./lib/priv/input_2", [], :line)
    |> Stream.map(&String.trim/1)
    |> Enum.reduce({0, 0}, fn item, {doubles, triples} ->
      item
      |> String.graphemes()
      |> get_increments
      |> case do
        {true, true} -> {doubles + 1, triples + 1}
        {true, false} -> {doubles + 1, triples + 0}
        {false, true} -> {doubles + 0, triples + 1}
        {false, false} -> {doubles + 0, triples + 0}
      end
    end)
    |> multiply()
    |> IO.inspect()
  end

  def multiply({a, b}), do: a * b

  def get_increments(graphemes) do
    counts =
      graphemes
      |> Enum.group_by(&(&1))
      |> Map.values()
      |> Enum.map(&length/1)

    {Enum.member?(counts, 2), Enum.member?(counts, 3)}
  end
end
