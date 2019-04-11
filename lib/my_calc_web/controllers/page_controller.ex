defmodule MyCalcWeb.PageController do
  use MyCalcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
