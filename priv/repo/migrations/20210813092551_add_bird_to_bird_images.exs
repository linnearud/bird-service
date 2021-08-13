defmodule Birdservice.Repo.Migrations.AddBirdToBirdImages do
  use Ecto.Migration

  def change do
    alter table(:bird_images) do
      add :bird_id, references(:birds)
    end
  end
end
