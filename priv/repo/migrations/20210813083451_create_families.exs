defmodule Birdservice.Repo.Migrations.CreateFamilies do
  use Ecto.Migration

  def change do
    create table(:families) do
      add :slug, :string
      add :name_latin, :string
      add :name_sv, :string

      timestamps()
    end

  end
end
