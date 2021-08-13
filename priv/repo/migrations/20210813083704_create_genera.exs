defmodule Birdservice.Repo.Migrations.CreateGenera do
  use Ecto.Migration

  def change do
    create table(:genera) do
      add :slug, :string
      add :name_latin, :string
      add :name_sv, :string

      timestamps()
    end

  end
end
