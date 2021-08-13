defmodule Birdservice.Birds.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Birdservice.Birds.Family

  schema "orders" do
    field :name_latin, :string
    field :name_sv, :string
    field :slug, :string
    field :image_path, :string

    has_many :families, Family

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:slug, :name_latin, :name_sv])
    |> validate_required([:slug, :name_latin, :name_sv])
  end
end
