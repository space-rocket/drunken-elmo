defmodule DrunkenElmo.StyleGuideController do
  use DrunkenElmo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
