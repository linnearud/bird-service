defmodule Birdservice.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :slug, :string
      add :name_latin, :string
      add :name_sv, :string

      timestamps()
    end

  end
end
