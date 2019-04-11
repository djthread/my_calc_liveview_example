defmodule MyCalcWeb.Router do
  use MyCalcWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyCalcWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/calc", CalcLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyCalcWeb do
  #   pipe_through :api
  # end
end
