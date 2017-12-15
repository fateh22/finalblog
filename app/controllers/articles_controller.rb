class ArticlesController < ApplicationController
	before_action :authenticate_user! , except: [:index,:show]
	def index
		@articles=Article.all

	end

	def new

		@article=current_user.articles.build

		
	end

	def create
		
		@article = current_user.articles.build(article_params) 

		if @article.save

		redirect_to articles_path

		else
			render 'new'
		end
	end

	def edit
		@article=Article.find(params[:id])

	end

	def show 

		@article =Article.find(params[:id])

	end

	def update 

 		 @article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success]="successfully update "
			redirect_to edit_article_path(@article)
		else
			
			render 'edit'
		end

	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy

		redirect_to articles_path

	end



	#parameter 

	private

	 def article_params 
	 	params.require(:article).permit!
	 end

end
