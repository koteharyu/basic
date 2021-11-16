class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string
  attribute :comment_body, :string
  attribute :username, :string

  def search
    scope = Post.all
    scope = scope.body_contain(body) if body.present?
    scope = scope.comment_body(comment_body) if comment_body.present?
    scope = scope.username_contain(username) if username.present?
    scope
  end
end
