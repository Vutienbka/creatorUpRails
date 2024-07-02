module Users
  class PostsController < UsersController
    before_action :set_post, only: %i[ show edit update destroy ]

    # GET /posts or /posts.json
    def index
      @posts = current_user.posts
    end

    # GET /posts/1 or /posts/1.json
    def show
    end

    # GET /posts/new
    def new
      @post = current_user.posts.build
    end

    # GET /posts/1/edit
    def edit
      @paragraph = @post.elements.build(element_type: "paragraph")
    end

    # POST /posts or /posts.json
    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to posts_path, notice: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy!

      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description)
    end
  end
end
