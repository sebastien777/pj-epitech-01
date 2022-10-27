defmodule ApiProject.Repo.Migrations.WorkingtimesBelongToUser do
  use Ecto.Migration

  def change do
    alter table(:workingtimes) do
      add :user, references(:users, on_delete: :delete_all)
    end

  end
end
