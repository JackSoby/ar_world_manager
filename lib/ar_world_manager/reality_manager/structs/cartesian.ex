defmodule ArWorldManager.RealityManager.Structs.Cartesian do
  use Ecto.Schema
  import Ecto.Changeset
  require IEx

  embedded_schema do
    field(:x, :float)
    field(:y, :float)
    field(:z, :float)
  end

  def changeset(cartesian, attrs \\ %{}) do
    res =
      cartesian
      |> cast(attrs, [
        :x,
        :y,
        :z
      ])

    res
  end
end
