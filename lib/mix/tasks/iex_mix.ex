defmodule Mix.Tasks.IexMix do
  use Mix.Task

  @shortdoc "Execute iex.bat -S mix."

  def run(_args) do
    System.cmd("iex.bat", ["-S", "mix"], into: IO.stream(:stdio, :line))
  end
end
