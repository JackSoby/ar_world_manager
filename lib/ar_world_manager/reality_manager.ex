defmodule ArWorldManager.RealityManager do
  @moduledoc """
  The RealityManager context.
  """

  import Ecto.Query, warn: false
  alias ArWorldManager.Repo


  alias ArWorldManager.RealityManager.Schema.RealityMarker

  @doc """
  Returns the list of reality_markers.

  ## Examples

      iex> list_reality_markers()
      [%RealityMarker{}, ...]

  """
  def list_reality_markers do
    Repo.all(RealityMarker)
  end

  @doc """
  Gets a single reality_marker.

  Raises `Ecto.NoResultsError` if the Reality marker does not exist.

  ## Examples

      iex> get_reality_marker!(123)
      %RealityMarker{}

      iex> get_reality_marker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reality_marker!(id), do: Repo.get!(RealityMarker, id)

  @doc """
  Creates a reality_marker.

  ## Examples

      iex> create_reality_marker(%{field: value})
      {:ok, %RealityMarker{}}

      iex> create_reality_marker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reality_marker(attrs \\ %{}) do
    %RealityMarker{}
    |> RealityMarker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reality_marker.

  ## Examples

      iex> update_reality_marker(reality_marker, %{field: new_value})
      {:ok, %RealityMarker{}}

      iex> update_reality_marker(reality_marker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reality_marker(%RealityMarker{} = reality_marker, attrs) do
    reality_marker
    |> RealityMarker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a reality_marker.

  ## Examples

      iex> delete_reality_marker(reality_marker)
      {:ok, %RealityMarker{}}

      iex> delete_reality_marker(reality_marker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reality_marker(%RealityMarker{} = reality_marker) do
    Repo.delete(reality_marker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reality_marker changes.

  ## Examples

      iex> change_reality_marker(reality_marker)
      %Ecto.Changeset{source: %RealityMarker{}}

  """
  def change_reality_marker(%RealityMarker{} = reality_marker) do
    RealityMarker.changeset(reality_marker, %{})
  end
end
