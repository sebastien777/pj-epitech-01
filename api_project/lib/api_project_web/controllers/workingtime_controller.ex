defmodule ApiProjectWeb.WorkingtimeController do
  use ApiProjectWeb, :controller

  alias ApiProject.Schedule
  alias ApiProject.Schedule.Workingtime

  action_fallback ApiProjectWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Schedule.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Schedule.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Schedule.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Schedule.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Schedule.update_workingtime(workingtime, workingtime_params) do
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
