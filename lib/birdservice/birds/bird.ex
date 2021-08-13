defmodule Birdservice.Birds.Bird do
  use Ecto.Schema
  import Ecto.Changeset
  alias Birdservice.Birds.Genus
  alias Birdservice.Assets.BirdImage

  schema "birds" do
    field :characteristics, :string
    field :hunt, :string
    field :link, :string
    field :name_en, :string
    field :name_latin, :string
    field :name_sv, :string
    field :slug, :string
    field :spread, :string

    belongs_to :genus, Genus
    has_many :images, BirdImage

    timestamps()
  end

  @doc false
  def changeset(bird, attrs) do
    bird
    |> cast(attrs, [:slug, :name_sv, :name_latin, :name_en, :characteristics, :spread, :link, :hunt])
    |> validate_required([:slug, :name_sv, :name_latin, :name_en, :characteristics, :spread, :link, :hunt])
  end
end
