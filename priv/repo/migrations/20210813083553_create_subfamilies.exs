defmodule Birdservice.Repo.Migrations.CreateSubfamilies do
  use Ecto.Migration

  def change do
    create table(:subfamilies) do
      add :families, :string
      add :slug, :string
      add :name_latin, :string
      add :name_sv, :string

      timestamps()
    end

  end
end
