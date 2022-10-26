defmodule ApiProjectWeb.WorkingtimeController do
  use ApiProjectWeb, :controller

  alias ApiProject.Schedule
  alias ApiProject.Schedule.Workingtime

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Schedule.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def index_by_user(conn, params) do
    start = params["start"]
    stop = params["end"]
    user_id = params["user_id"]

    if start != nil && stop != nil && user_id != nil do
      my_workingtime = %Workingtime{
        start: start,
        end: stop,
        user: user_id
      }

      workingtimes = Schedule.list_one_workingtime(my_workingtime)
      render(conn, "index.json", workingtimes: workingtimes)
    else
      my_workingtime = %Workingtime{
        user: user_id
      }

      workingtimes = Schedule.list_workingtimes_by_user(my_workingtime)
      render(conn, "index.json", workingtimes: workingtimes)
    end
  end

  def create(conn, params) do
    user_id = params["user_id"]
    start = params["start"]
    stop = params["end"]

    if user_id != nil && start != nil && stop != nil do
      with {:ok, %Workingtime{} = workingtime} <-
        Schedule.create_workingtime(%{
          user: user_id,
          start: start,
        end: stop
        }) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
        |> render("show.json", workingtime: workingtime)
        end
      else
      conn
      |> put_status(:bad_request)
      |> render("error.json", message: "Bad request")
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Schedule.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def show_by_user(conn, params) do
    user_id = params["user_id"]
    id = params["id"]

    if user_id != nil && id != nil do
      workingtime = Schedule.get_workingtime_by_id!(id, user_id)
      render(conn, "show.json", workingtime: workingtime)
    else
      conn
      |> put_status(:bad_request)
      |> render("error.json", message: "Bad request")
    end
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Schedule.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <-
           Schedule.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Schedule.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Schedule.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
