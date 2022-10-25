defmodule ApiProject.Repo.Migrations.ClockBelongToUser do
  use Ecto.Migration

  def change do
      alter table(:clocks) do
        add :user, references(:users, on_delete: :nothing)
    end
  end
end
