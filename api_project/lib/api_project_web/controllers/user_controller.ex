defmodule ApiProjectWeb.UserController do
  use ApiProjectWeb, :controller

  alias ApiProject.Account
  alias ApiProject.Account.User

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, params) do
   email = params["email"]
   username = params["username"]
   if( email != nil && username != nil ) do
      my_user =  %User{
        email: email, 
        username: username
      } 
      users = Account.list_one_user(my_user)
      IO.inspect(users)
      IO.inspect("jchjqdbcj")
      render(conn, "index.json", users: users)

    else
    users = Account.list_users()
    render(conn, "index.json", users: users)
    end
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
    with {:ok, %User{} = user} <- Account.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Account.get_user!(id)

    with {:ok, %User{} = user} <- Account.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Account.get_user!(id)

    with {:ok, %User{}} <- Account.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
