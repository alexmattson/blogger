module ArticlesHelper
	
	def article_params
		params.require(:article).permit(:title, :body, :tag_list, :image)
	end

	def add_view
		@article.views += 1
		@article.save
	end
end
