defmodule DrunkenElmo.PhraseView do
  use DrunkenElmo.Web, :view

  def render("index.json", %{phrases: phrases}) do
    %{data: render_many(phrases, DrunkenElmo.PhraseView, "phrase.json")}
  end

  def render("show.json", %{phrase: phrase}) do
    %{data: render_one(phrase, DrunkenElmo.PhraseView, "phrase.json")}
  end

  def render("phrase.json", %{phrase: phrase}) do
    %{id: phrase.id,
      phrase: phrase.phrase,
      points: phrase.points,
      wasSpoken: phrase.wasSpoken}
  end
end
