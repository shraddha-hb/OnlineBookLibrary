class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

 before_action :authenticate_user!, :except => [:show]
  # before_filter :admin_user, :only => [:destroy, :edit, :update]
  
  # GET /users
  # GET /users.xml
  def index
    @title = "User List"
    @users = User.order_by([:created_at, :asc]).page(params[:page]) # Order by created at date

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    # @feed_items = @user.feed.page(params[:page])
    @title = @user.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @title = "Edit #{@user.name}"
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
  	
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    User.find(params[:id]).destroy

    respond_to do |format|
      flash[:success] = "User deleted."
      format.html { redirect_to(users_path) }
      # format.html { redirect_to(users_path, :notice => "User deleted.") }
      format.xml  { head :ok }
    end
  end

	def avatar
    content = @user.avatar.read
    if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, type: @user.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:name, :bio, :avatar, :academics,:awards)
    end
end
