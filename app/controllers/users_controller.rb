class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_user, except:[:show, :index, :new, :create]
  before_action :require_logged_in_user, only: %i[edit update destroy]


  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page], per_page:2)
  end

  # GET /users/1 or /users/1.json
  def show
    @articles= @user.articles
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @show_flash_message = true
  end

  # POST /users or /users.json
  def create
    @show_flash_message = false
    

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    session[:user_id] = nil if @user == current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :phone_no, :password)
    end
    def require_logged_in_user
      if current_user != @user && !current_user.admin?
        flash[:alert]="Cannot edit other user details"
        redirect_to @user
      end
    end
end
