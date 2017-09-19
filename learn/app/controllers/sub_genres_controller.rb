class SubGenresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sub_genre, only: [:show, :edit, :update, :destroy]

  # GET /sub_genres
  # GET /sub_genres.json
  def index
    if current_user.admin == true
      @sub_genres = SubGenre.all
    else
      redirect_to root_path
    end
  end

  # GET /sub_genres/1
  # GET /sub_genres/1.json
  def show
    if current_user.admin == true
    else
      redirect_to root_path
    end
  end

  # GET /sub_genres/new
  def new
    if current_user.admin == true
    @sub_genre = SubGenre.new
    else
      redirect_to root_path
    end
  end

  # GET /sub_genres/1/edit
  def edit
    if current_user.admin == true
    else
      redirect_to root_path
    end
  end

  # POST /sub_genres
  # POST /sub_genres.json
  def create
    @sub_genre = SubGenre.new(sub_genre_params)

    respond_to do |format|
      if @sub_genre.save
        format.html { redirect_to @sub_genre, notice: 'Sub genre was successfully created.' }
        format.json { render :show, status: :created, location: @sub_genre }
      else
        format.html { render :new }
        format.json { render json: @sub_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_genres/1
  # PATCH/PUT /sub_genres/1.json
  def update
    respond_to do |format|
      if @sub_genre.update(sub_genre_params)
        format.html { redirect_to @sub_genre, notice: 'Sub genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_genre }
      else
        format.html { render :edit }
        format.json { render json: @sub_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_genres/1
  # DELETE /sub_genres/1.json
  def destroy
    @sub_genre.destroy
    respond_to do |format|
      format.html { redirect_to sub_genres_url, notice: 'Sub genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_genre
      @sub_genre = SubGenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_genre_params
      params.require(:sub_genre).permit(:subgenrename, :genre_id)
    end
end
