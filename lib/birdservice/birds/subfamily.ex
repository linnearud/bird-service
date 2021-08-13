defmodule Birdservice.Birds.Subfamily do
  use Ecto.Schema
  import Ecto.Changeset
  alias Birdservice.Birds.Family
  alias Birdservice.Birds.Genus

  schema "subfamilies" do
    field :families, :string
    field :name_latin, :string
    field :name_sv, :string
    field :slug, :string

    belongs_to :family, Family
    has_many :genera, Genus

    timestamps()
  end

  @doc false
  def changeset(subfamily, attrs) do
    subfamily
    |> cast(attrs, [:families, :slug, :name_latin, :name_sv])
    |> validate_required([:families, :slug, :name_latin, :name_sv])
  end
end
