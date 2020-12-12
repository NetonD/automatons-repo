defmodule Mix.Tasks.Ends01 do
  use Mix.Task
  alias NoDeterministic.NfaStringEnd01
  @shortdoc "Task that recognize if string of 0s and 1s ends in 01"

  def run(args) do
    args
    |> Enum.at(0)
    |> NfaStringEnd01.check()
  end
end
