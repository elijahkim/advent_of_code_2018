defmodule Mix.Tasks.Day1Puzzle2 do
  use Mix.Task

  def run(_) do
    File.stream!("./lib/priv/input_1-1", [], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.cycle()
    |> Enum.reduce_while({0, []}, fn item, {sum, list} ->
      current_sum = sum + item

      case Enum.member?(list, current_sum) do
        true -> {:halt, current_sum}
        false -> {:cont, {current_sum, [current_sum | list]}}
      end
    end)
    |> IO.inspect()
  end
end
