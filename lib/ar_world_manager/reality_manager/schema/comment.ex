defmodule ArWorldManager.RealityManager.Schema.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.Accounts.User
  alias ArWorldManager.RealityManager.Schema.DetectionImage

  schema "comments" do
    belongs_to(:user, User)
    belongs_to(:detection_image, DetectionImage)
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:user_id, :reality_marker_id, :content])
  end
end
