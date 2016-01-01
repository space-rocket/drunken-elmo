defmodule DrunkenElmo.Router do
  use Addict.RoutesHelper
  use DrunkenElmo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser # Use the default browser stack

    get "/", DrunkenElmo.PageController, :index
    get "/show", DrunkenElmo.PageController, :show
    get "/forbidden", DrunkenElmo.PageController, :forbidden

    get "/sign-in", DrunkenElmo.SignInController, :index
    get "/register", DrunkenElmo.SignUpController, :index

    get "/bingo", DrunkenElmo.BingoController, :index
    get "/blog", DrunkenElmo.BlogController, :index
    get "/style-guide", DrunkenElmo.StyleGuideController, :index
    get "/contact", DrunkenElmo.ContactController, :index
    
    resources "/api/posts", DrunkenElmo.PostController, except: [:new, :edit]
    resources "/api/artists", DrunkenElmo.ArtistController, except: [:new, :edit]
    resources "/api/phrases", DrunkenElmo.PhraseController, except: [:new, :edit]
    resources "/api/users", DrunkenElmo.UserController, except: [:new, :edit]

    addict :routes,
      logout: [path: "/logout", controller: DrunkenElmo.UserController, action: :signout],
      recover_password: "/password/recover",
      reset_password: "/password/reset"
  end

  scope "/phrases", DrunkenElmo do
    pipe_through :api

    resources "/phrases", PhrasesController
  end

end
