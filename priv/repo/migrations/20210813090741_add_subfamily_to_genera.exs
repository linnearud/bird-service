defmodule Birdservice.Repo.Migrations.AddSubfamilyToGenera do
  use Ecto.Migration

  def change do
    alter table(:genera) do
      add :subfamily_id, references(:subfamilies)
    end
  end
end
