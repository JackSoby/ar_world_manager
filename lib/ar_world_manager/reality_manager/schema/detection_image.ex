defmodule ArWorldManager.RealityManager.Schema.DetectionImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.RealityManager.Schema.Like
  alias ArWorldManager.RealityManager.Schema.Comment
  alias ArWorldManager.RealityManager.Schema.RealityMarker

  schema "detection_images" do
    field :image_url, :string
    has_many(:likes, Like)
    has_many(:comments, Comment)
    has_many(:reality_markers, RealityMarker)

    timestamps()
  end

  @doc false
  def changeset(detection_image, attrs) do
    detection_image
    |> cast(attrs, [:image_url])
    |> validate_required([:image_url])
    |> cast_assoc(:likes)
    |> cast_assoc(:comments)
    |> cast_assoc(:reality_markers)
  end
end
