class KemalTest::Controllers::PostsController
  before_all "/posts" do |env|
    env.response.content_type = "application/json"
  end

  get "/posts" do |env|
    posts = Post.all.map(&.to_h)
    posts.to_json
  end

  post "/posts" do |env|
    json = JSON.parse(env.request.body as String)
    post = Post.create({
      "title" => json["title"].to_s,
      "body" => json["body"].to_s
    })
    post.to_h.to_json
  end

  delete "/posts/:id" do |env|
     Post.get(env.params.url["id"]).delete
  end
end