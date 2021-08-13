defmodule Birdservice.Repo.Migrations.AddToGeneraToBirds do
  use Ecto.Migration

  def change do
    alter table(:birds) do
      add :genus_id, references(:genera)
    end
  end
end
