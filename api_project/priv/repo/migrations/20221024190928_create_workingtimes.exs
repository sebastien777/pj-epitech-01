defmodule ApiProject.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :naive_datetime, null: false, required: true
      add :end, :naive_datetime, null: false, required: true

      timestamps()
    end

    #create index(:workingtimes, [:id])
  end
end
