defmodule Laboratory.DetsStoreTest do
  use ExUnit.Case, async: true

  alias Laboratory.DetsStore, as: DS

  setup do
    on_exit(fn -> File.rm("features") end)
  end

  test "enables features" do
    refute DS.enabled?(:foo)

    DS.enable(:foo)

    assert DS.enabled?(:foo)
    refute DS.enabled?(:bar)
  end

  test "enables features while ignoring additional options" do
    refute DS.enabled?(:foo)

    DS.enable(:foo, conn: %{})

    assert DS.enabled?(:foo)
    refute DS.enabled?(:bar)
  end

  test "disables features" do
    DS.enable(:foo)
    assert DS.enabled?(:foo)

    DS.disable(:foo)

    refute DS.enabled?(:foo)
  end
end
