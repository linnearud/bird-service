defmodule Birdservice.Assets.BirdImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Birdservice.Birds.Bird

  schema "bird_images" do
    field :path, :string

    belongs_to :bird, Bird

    timestamps()
  end

  @doc false
  def changeset(bird_image, attrs) do
    bird_image
    |> cast(attrs, [:path])
    |> validate_required([:path])
  end
end
