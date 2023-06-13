module Authors

  class PostsController < AuthorsController
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
      @posts = current_author.posts.all
    end

    # GET /authors/posts/new
    def new
      @post = current_author.posts.build
    end

    # GET /authors/posts/1/edit
    def edit
      @element = @post.elements.build
    end

    # POST /authors/posts
    # POST /authors/posts.json
    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to authors_posts_path, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /authors/posts/1
    # PATCH/PUT /authors/posts/1.json
    def update
      if @post.update(post_params)
        redirect_to [:authors, @post], notice: 'Post was successfully updated.'
        head :no_content
      else
        render action: 'edit'
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE /authors/posts/1
    # DELETE /authors/posts/1.json
    def destroy
      @post.destroy

      redirect_to authors_posts_url, notice: 'Post was successfully destroyed.'
      head :no_content
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_author.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description)
    end
  end
end