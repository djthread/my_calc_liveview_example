defmodule MyCalcWeb.CalcLive do
  import Phoenix.LiveView
  # import Phoenix.HTML

  def render(%{nav: nav} = assigns) do
    counter_style = if nav == "counter", do: ~s/ style="font-weight:bold"/
    other_style = if nav == "other", do: ~s/ style="font-weight:bold"/

    ~L"""
    <p>
      <b>Nav:</b>
      <a href="#" phx-click="nav" phx-value="counter"<%= counter_style %>>Counter</a> |
      <a href="#" phx-click="nav" phx-value="other"<%= other_style %>>Other</a>
    </p>

    <%= case nav do %>
      <% "counter" -> %>
        <h1>Counter Thingy</h1>
        <h2>Value: <%= @value %></h2>
        <p>
          <a href="#" phx-click="inc">Increment</a><br>
          <a href="#" phx-click="dec">Decrement</a><br>
        </p>
        <p>
          <a href="#" phx-click="inc" phx-value="5">Increment by 5</a><br>
          <a href="#" phx-click="dec" phx-value="5">Decrement by 5</a><br>
        </p>

      <% "other" -> %>
        Hello world!
    <% end %>
    """
  end

  def mount(_session, socket) do
    socket =
      socket
      |> assign(:nav, "counter")
      |> assign(:value, 0)
      |> assign(:something_else, "etc")

    {:ok, socket}
  end

  def handle_event("inc", amount, socket) do
    num = get_num(amount)
    value = socket.assigns.value
    {:noreply, assign(socket, :value, value + num)}
  end

  def handle_event("dec", amount, socket) do
    num = get_num(amount)
    value = socket.assigns.value
    {:noreply, assign(socket, :value, value - num)}
  end

  def handle_event("nav", nav, socket) when nav in ~w(counter other) do
    {:noreply, assign(socket, :nav, nav)}
  end

  defp get_num(""), do: 1
  defp get_num(val), do: String.to_integer(val)
end