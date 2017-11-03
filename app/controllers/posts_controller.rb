class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  
  # add_breadcrumb "Posts", :Posts_path, :only => %w(index show)

  # GET /posts
  def index
    page     = params[:page]
    per_page = params[:per_page]
    @posts = Post.all.active.page(page).per(per_page)
  end

  # GET /Posts/list
  # def list
    # page     = params[:page]
    # per_page = params[:per_page]
    # @Posts = Post.all.page(page).per(per_page)
    # add_breadcrumb 'Posts Liste', Posts_list_path
  # end

  # GET /Posts/1
  # def comments
    # page     = params[:page]
    # per_page = params[:per_page]
    # add_breadcrumb @Post.title.titlecase, Posts_path+@Post.slug
    # @comments = @Post.comments.page(page).per(per_page)
    # add_breadcrumb 'Posts Liste', Posts_list_path
    # add_breadcrumb 'Commentaires'
  # end

  # PAUSE  /Posts/1
  # PAUSE /Posts/1.json
  # def comment_enable_disable
    # @comment = Comment.find(params[:comment_id])
    # if @comment.status?
      # @comment.status = 0
      # @comment.save
      # notice = "Le commentaire a été non approuvé avec succès ."
    # else
      # @comment.status = 1
      # @comment.save
      # notice = "Le commentaire a été approuvé avec succès ."
    # end
    # respond_to do |format|
      # format.html { redirect_to comments_Post_path, notice: notice }
      # format.json { head :no_content }
    # end
  # end

  # GET /Posts/1
  def show
    # @comment  = Comment.new
    # add_breadcrumb @Post.title.titlecase
  end

  # GET /Post/new
  def new
    @post = Post.new
    # add_breadcrumb 'Créer un Post'
  end

  # POST /Posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post a été créé avec succès.'
    else
      render :new
    end
  end

  # POST /Posts
  # def add_comment
    # @comment = Comment.new(comment_params)
    # if @comment.save
      # redirect_to Post_path(id: @Post.slug), notice: "Le commentaire a été publié avec succès . Il sera montré après approbation par admin ."
    # else
      # render :show
    # end
  # end

  # POST /Posts
  # def reply_comment
    # @comment = Comment.new(comment_params)
    # if @comment.save
      # redirect_to Post_path(id: @Post.slug), notice: "Le commentaire a été posté avec succès."
    # else
      # render :show
    # end
  # end

  # GET /Posts/1/edit
  def edit
    # add_breadcrumb @Post.title.titlecase
  end

  # PATCH/PUT /Posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  # DELETE /Posts/1
  # def destroy
    # @Post.destroy
    # redirect_to Posts_list_url, notice: 'Post a été détruit avec succès.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(
          :title,
          :content,
          :publish,
          :meta_title,
          :meta_desc
      )
    end

    # def comment_params
      # params.require(:comment).permit(
          # :Post_id,
          # :name,
          # :email,
          # :website,
          # :comment,
          # :root_id,
          # :parent_id
      # )
    # end
  
end
