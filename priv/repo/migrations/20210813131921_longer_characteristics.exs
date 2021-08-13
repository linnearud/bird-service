defmodule Birdservice.Repo.Migrations.LongerCharacteristics do
  use Ecto.Migration

  def change do
    alter table(:birds) do
      modify :characteristics, :text
      modify :spread, :text
    end
  end
end
