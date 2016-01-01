defmodule DrunkenElmo.PostView do
  use DrunkenElmo.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, DrunkenElmo.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, DrunkenElmo.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      name: post.name}
  end
end
