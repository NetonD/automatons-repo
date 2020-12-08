defmodule Deterministic.OddOnes do
  @moduledoc """
  Given a string with the alphabet be 0s and 1s can determine if
  it have a number odd of 1s.

  This is the transition table for this automaton

  xx| 1 | 0 |
  --|---|---|
  A | B | A |
  B | A | B |

  """

  @doc """
  Apply the extended delta function along the string to check if has or not number odd of 1s.

  ## Parameters:
    `string` - A string that match with regex 0*1*
  """
  def check(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reduce(:A, fn symbol, state -> delta(state, symbol) end)
    |> case  do
      :A -> IO.puts "This string NO has number odd of ones."
      :B -> IO.puts "This string has number odd of ones."
    end
  end

  defp delta(:A, "1"), do: :B
  defp delta(:A, "0"), do: :A
  defp delta(:B, "1"), do: :A
  defp delta(:B, "0"), do: :B

end
