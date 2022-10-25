defmodule ApiProject.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :naive_datetime
      add :status, :boolean, default: false, null: false
      
      timestamps()
    end

    # create index(:clocks, [:id])
  end
end
