defmodule ApiProject.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false, required: true
      add :email, :string, null: false, required: true

      timestamps()
    end
  end
end
