defmodule Laboratory.DetsStore do
  @moduledoc """
  A DETS based store for feature flags.
  """

  @doc """
  Checks if the given feature id is enabled.

      > Laboratory.DetsStore.enabled?(:foo)
      false
  """
  def enabled?(feature, _opts \\ []) do
    open_file()
    :dets.member(:features, feature)
  end

  @doc """
  Enables the feature with the id.
  """
  def enable(feature, _opts \\ []) do
    open_file()
    :dets.insert(:features, {feature, true})
  end

  @doc """
  Disable the feature with the id.
  """
  def disable(feature, _opts \\ []) do
    open_file()
    :dets.delete(:features, feature)
  end

  defp open_file do
    :dets.open_file(:features, type: :set)
  end
end
