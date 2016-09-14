defmodule LaboratoryTest do
  use ExUnit.Case, async: true

  setup do
    on_exit(fn -> File.rm("features") end)
  end

  test "enables features using DetsStore" do
    refute Laboratory.enabled?(:foo, store: Laboratory.DetsStore)

    Laboratory.enable(:foo, store: Laboratory.DetsStore)

    assert Laboratory.enabled?(:foo, store: Laboratory.DetsStore)
    refute Laboratory.enabled?(:bar, store: Laboratory.DetsStore)
  end
end
