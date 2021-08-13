defmodule Birdservice.Assets do
  @moduledoc """
  The Assets context.
  """

  import Ecto.Query, warn: false
  alias Birdservice.Repo

  alias Birdservice.Assets.BirdImage

  @doc """
  Returns the list of bird_images.

  ## Examples

      iex> list_bird_images()
      [%BirdImage{}, ...]

  """
  def list_bird_images do
    Repo.all(BirdImage)
  end

  @doc """
  Gets a single bird_image.

  Raises `Ecto.NoResultsError` if the Bird image does not exist.

  ## Examples

      iex> get_bird_image!(123)
      %BirdImage{}

      iex> get_bird_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bird_image!(id), do: Repo.get!(BirdImage, id)

  @doc """
  Creates a bird_image.

  ## Examples

      iex> create_bird_image(%{field: value})
      {:ok, %BirdImage{}}

      iex> create_bird_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bird_image(attrs \\ %{}) do
    %BirdImage{}
    |> BirdImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bird_image.

  ## Examples

      iex> update_bird_image(bird_image, %{field: new_value})
      {:ok, %BirdImage{}}

      iex> update_bird_image(bird_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bird_image(%BirdImage{} = bird_image, attrs) do
    bird_image
    |> BirdImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bird_image.

  ## Examples

      iex> delete_bird_image(bird_image)
      {:ok, %BirdImage{}}

      iex> delete_bird_image(bird_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bird_image(%BirdImage{} = bird_image) do
    Repo.delete(bird_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bird_image changes.

  ## Examples

      iex> change_bird_image(bird_image)
      %Ecto.Changeset{data: %BirdImage{}}

  """
  def change_bird_image(%BirdImage{} = bird_image, attrs \\ %{}) do
    BirdImage.changeset(bird_image, attrs)
  end
end
