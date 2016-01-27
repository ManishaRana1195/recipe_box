class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipes = Recipe.all.order('created_at DESC')
	end

	def show
	end

	def new
		@recipe = Recipe.new
	end

	def create
	@recipe = Recipe.new(recipe_params) 
	@recipe.image = params[:file]
		if @recipe.save
			redirect_to recipe_path(@recipe), notice: "Successfully created new recipe "
		else
			render 'new'
		end

	end

	def edit 
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe), notice: "Successfully updated new recipe "
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.delete
		redirect_to root_path, notice: "Successfully deleted the recipe"
	end

	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id,:step, :_destroy])
	end
end
