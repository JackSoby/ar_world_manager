defmodule ArWorldManager.RealityManager.Schema.RealityMarker do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.RealityManager.Structs.Cartesian
  alias ArWorldManager.RealityManager.Schema.DetectionImage
  require IEx
  schema "reality_markers" do
    field :content, :string
    field :scale, :float
    field :type, :string
    field :latitude, :float
    field :longitude, :float
    field :horizontal_accuracy, :float
    field :vertical_accuracy, :float
    field :altitude, :float
    embeds_one(:position, Cartesian)
    embeds_one(:euler_angles, Cartesian)
    belongs_to(:detection_image, DetectionImage)

    timestamps()
  end

  @doc false
  def changeset(reality_marker, attrs) do
    res =
      reality_marker
      |> cast(attrs, [:type, :scale, :latitude, :longitude, :content, :detection_image_id, :horizontal_accuracy, :vertical_accuracy, :altitude])
      |> cast_embed(:position)
      |> cast_embed(:euler_angles)
      |> validate_required([:type,  :content])

    res
  end
end
