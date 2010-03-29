class CommentsController < ApplicationController
  before_filter :require_login, :only => [:new, :update, :edit, :destroy]
  before_filter :get_track, :only => [:show, :new, :create, :update]
  
  def index
    @comments = Comment.all

  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    
    @comment = @track.comments.build
    
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @track.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@track)
    else
      render :action => "new"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to(@track)
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_url)  
  end
  
  private
    def get_track
      if (params[:track_id])
        @track = Track.find(params[:track_id])
      else
        flash[:error] = "No track specified to comment on."
        redirect_to tracks_path
      end
    end
end
