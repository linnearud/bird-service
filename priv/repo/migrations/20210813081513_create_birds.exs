defmodule Birdservice.Repo.Migrations.CreateBirds do
  use Ecto.Migration

  def change do
    create table(:birds) do
      add :slug, :string
      add :name_sv, :string
      add :name_latin, :string
      add :name_en, :string
      add :characteristics, :string
      add :spread, :string
      add :link, :string
      add :hunt, :string

      timestamps()
    end

  end
end
