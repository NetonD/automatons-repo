defmodule AutomatonsTest do
  use ExUnit.Case
  doctest Automatons

  test "greets the world" do
    assert Automatons.hello() == :world
  end
end
