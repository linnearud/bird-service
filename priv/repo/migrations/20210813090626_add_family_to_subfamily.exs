defmodule Birdservice.Repo.Migrations.AddFamilyToSubfamily do
  use Ecto.Migration

  def change do
    alter table(:subfamilies) do
      add :family_id, references(:families)
    end
  end
end
