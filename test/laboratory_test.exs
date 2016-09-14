defmodule LaboratoryTest do
  use ExUnit.Case, async: true

  setup do
    on_exit(fn -> File.rm("features") end)
  end

  test "enables features using DetsStore" do
    refute Laboratory.enabled?(:foo)

    Laboratory.enable(:foo)

    assert Laboratory.enabled?(:foo)
    refute Laboratory.enabled?(:bar)
  end
end
