defmodule Supabase.UITest do
  use ExUnit.Case

  doctest Supabase.UI

  test "greets the world" do
    assert Supabase.UI.hello() == :world
  end
end
