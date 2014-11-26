class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    @wikis = Wiki.all
  end
	
  # GET /wikis/1
  # GET /wikis/1.json
  def show
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
	
  end

  def collaborate
    #@collaborator = Collaborator.new(user_id: params[:user_id], wiki_id: params[:id])
    
    @wiki = current_user.wikis.find(params[:id])

    @wiki.collaborators.new(user_id:params[:user_id])


    respond_to do |format|
      if @wiki.save
        format.html { redirect_to wiki_path(params[:id]), notice: 'User successfully added as collaborator.' }
        format.json { render :show, status: :ok, location: wiki_path(params[:id]) }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end


  # POST /wikis
  # POST /wikis.json
  def create
    attributes = wiki_params
 
    attributes.delete(:privatewiki) if current_user.user?
    @wiki = Wiki.new(attributes)

		@wiki.user_id = current_user.id

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render :show, status: :created, location: @wiki }
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

	def privatewiki
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update

		
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :privatewiki)
    end
end
