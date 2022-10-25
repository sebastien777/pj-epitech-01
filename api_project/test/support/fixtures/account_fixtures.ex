defmodule ApiProject.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiProject.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> ApiProject.Account.create_user()

    user
  end
end
