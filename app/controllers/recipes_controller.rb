class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe.ingredients.build if @recipe.ingredients.empty?
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build # 材料の空オブジェクトを生成
  end

  # GET /recipes/1/edit
  def edit
    @recipe.ingredients.build if @recipe.ingredients.empty?
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'レシピが正常に作成されました。'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'レシピが正常に更新されました。'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    if @recipe.destroy
      flash[:notice] = 'レシピが正常に削除されました。'
      redirect_to recipes_url
    else
      flash[:alert] = 'レシピの削除に失敗しました。'
      redirect_to recipes_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def check_owner
      unless @recipe.user == current_user
        redirect_to root_path, alert: 'この操作を実行する権限がありません。'
      end
    end

    # Only allow a list of trusted parameters through
    def recipe_params
      params.require(:recipe).permit(
        :title,
        :description,
        :instructions,
        :image,
        { color_group_ids: [] },
        ingredients_attributes: [:id, :name, :quantity, :_destroy]
      ).merge(user_id: current_user.id)
    end
end
