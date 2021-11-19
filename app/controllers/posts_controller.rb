class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  PostReducer = Rack::Reducer.new(
    Post.all,
    ->(title:)    {where('lower(title) like ?', "%#{title.downcase}%")},
    ->(category:) {where(category: category)},
    ->(order: :created_at)  {reorder('created_at DESC')}
  )

  # GET /posts
  def index
    @posts = PostReducer.apply(request.query_parameters)

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post , serializer: PostDetailSerializer
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :image, :category_id, :user_id)
    end
end
