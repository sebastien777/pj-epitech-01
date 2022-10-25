defmodule ApiProject.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  @mail_regex ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/

  schema "users" do
    field :email, :string
    field :username, :string
    has_one :clock, ApiProject.Timers.Clock
    has_one :workingtime, ApiProject.Schedule.Workingtime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, @mail_regex)
  end
end
