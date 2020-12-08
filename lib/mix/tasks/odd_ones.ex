defmodule Mix.Tasks.OddOnes do
  use Mix.Task
  alias Deterministic.OddOnes
  @shortdoc "Check if string has odd number of ones."
  def run(args) do
    args
    |> Enum.at(0)
    |> OddOnes.check()
  end
end
