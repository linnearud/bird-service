defmodule Birdservice.Birds.Family do
  use Ecto.Schema
  import Ecto.Changeset
  alias Birdservice.Birds.Order
  alias Birdservice.Birds.Subfamily
  alias Birdservice.Birds.Genus

  schema "families" do
    field :name_latin, :string
    field :name_sv, :string
    field :slug, :string

    belongs_to :order, Order
    has_many :subfamilies, Subfamily
    has_many :genera, Genus

    timestamps()
  end

  @doc false
  def changeset(family, attrs) do
    family
    |> cast(attrs, [:slug, :name_latin, :name_sv])
    |> validate_required([:slug, :name_latin, :name_sv])
  end
end
