defmodule ArWorldManager.RealityManager.Schema.DetectionImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.RealityManager.Schema.RealityMarker

  schema "detection_images" do
    field :image_url, :string
    field :latitude, :float
    field :longitude, :float
    has_many(:reality_markers, RealityMarker)

    timestamps()
  end

  @doc false
  def changeset(detection_image, attrs) do
    detection_image
    |> cast(attrs, [:image_url, :longitude, :latitude])
    |> cast_assoc(:reality_markers)
  end
end
