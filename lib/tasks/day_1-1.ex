defmodule Mix.Tasks.Day1Puzzle1 do
  use Mix.Task

  def run(_) do
    File.stream!("./lib/priv/input_1-1", [], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
    |> IO.puts()
  end
end
