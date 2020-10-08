defmodule ArWorldManager.RealityManager.Schema.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.RealityManager.Schema.RealityMarker
  alias ArWorldManager.Accounts.User

  schema "likes" do
    belongs_to(:user, User)
    belongs_to(:reality_marker, RealityMarker)

    timestamps()
  end

  @doc false
  def changeset(detection_image, attrs) do
    detection_image
    |> cast(attrs, [:user_id, :reality_marker_id])
  end
end
