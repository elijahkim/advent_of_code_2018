defmodule Mix.Tasks.Day2Puzzle2 do
  use Mix.Task

  def run(_) do
    lines =
      File.stream!("./lib/priv/input_2", [], :line)
      |> Enum.map(&String.trim/1)

    for i <- lines, j <- lines do
      String.myers_difference(i, j)
    end
    |> Enum.find(fn difference ->
      filtered = difference |> Enum.reject(fn {k, _v} -> k == :eq end)

      case filtered do
        [del: a, ins: b] ->
          length_a = a |> String.graphemes |> length()
          length_b = b |> String.graphemes |> length()

          length_a == 1 and length_b == 1

        _item -> false
      end
    end)
    |> Enum.filter(fn {k, _v} -> k == :eq end)
    |> Keyword.values()
    |> Enum.join()
    |> IO.inspect
  end
end
