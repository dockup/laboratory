defmodule Laboratory.DetsStore do
  @moduledoc """
  A DETS based store for feature flags.
  """
  
  def enable(feature, _opts \\ []) do
    open_file()
    :dets.insert(:features, {feature, true})
  end

  def disable(feature, _opts \\ []) do
    open_file()
    :dets.delete(:features, feature)
  end

  def enabled?(feature, _opts \\ []) do
    open_file()
    :dets.member(:features, feature)
  end

  defp open_file do
    :dets.open_file(:features, type: :set)
  end
end
