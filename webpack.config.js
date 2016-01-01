var ExtractTextPlugin = require("extract-text-webpack-plugin");
module.exports = {
  entry: ["./web/static/js/app.js"],
  output: {
    path: "./priv/static",
    filename: "js/app.js"
  },

  resolve: {
    modulesDirectories: [ __dirname ]
  },

  module: {
    loaders: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loaders: ["babel"],
      include: __dirname
    }]
  },

  plugins: [
  ]
};
