defmodule Birdservice.Birds.Genus do
  use Ecto.Schema
  import Ecto.Changeset
  alias Birdservice.Birds.Subfamily
  alias Birdservice.Birds.Family
  alias Birdservice.Birds.Bird

  schema "genera" do
    field :name_latin, :string
    field :name_sv, :string
    field :slug, :string

    belongs_to :subfamily, Subfamily
    belongs_to :family, Family
    has_many :birds, Bird

    timestamps()
  end

  @doc false
  def changeset(genus, attrs) do
    genus
    |> cast(attrs, [:slug, :name_latin, :name_sv])
    |> validate_required([:slug, :name_latin, :name_sv])
  end
end
