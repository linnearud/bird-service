defmodule Birdservice.Repo.Migrations.AddFamilyToGenera do
  use Ecto.Migration

  def change do
    alter table(:genera) do
      add :family_id, references(:families)
    end
  end
end
