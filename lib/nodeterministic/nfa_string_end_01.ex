defmodule NoDeterministic.NfaStringEnd01 do
  @moduledoc """
  Implementation of NFA (non deterministic finite automaton) that recognizes
  if the string of 0s and 1s ends with 01.

  Table of transitions
  xxxx|   0   | 1
  ----|-------|---
  A   | {A,B} | {A}
  B   | {}    | {C}
  C   | {}    | {}

  """
  def check(string) do
    String.split(string, "", trim: true)
    |> Enum.reduce([:A], fn symbol, state_set ->
      delta_in_set(state_set, symbol)
    end)
    |> has_final?()
    |> show_answer()
  end

  defp has_final?(list_state) do
    :C in list_state
  end

  defp show_answer(true), do: "This string ends in 01"
  defp show_answer(false), do: "This string DO NOT ends in 01"

  defp delta_in_set(state_set, symbol) do
    Enum.map(state_set, fn state ->
      delta(state, symbol)
    end)
    |> List.flatten()
    |> Enum.uniq()
  end

  defp delta(:A, "0"), do: [:A, :B]
  defp delta(:A, "1"), do: [:A]
  defp delta(:B, "1"), do: [:C]
  defp delta(_state, _symbol), do: []

end
