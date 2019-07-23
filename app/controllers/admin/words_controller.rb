module Admin 
  class WordsController < ApplicationController

    before_action :logged_in_user
    before_action :admin_user

    def index
      @category = Category.find(params[:category_id])
      @words = @category.words.paginate(page: params[:page])
    end

    def show
    end

    def new
      @category = Category.find(params[:category_id])
      @word = @category.words.build
      3.times { @word.choices.build }
    end
  
    def create
      @category = Category.find(params[:category_id])
      @word = @category.words.build(word_params)
      if @word.save
        flash[:success] = "Word successfully created!"
        redirect_to admin_category_words_url
      else
        render 'new'
      end
    end

    def edit
      @word = Word.find(params[:id])
      @category = Category.find(params[:category_id])
    end

    def update
      @category = Category.find(params[:category_id])
      @word = Word.find(params[:id])
        if @word.update_attributes(word_params)
          flash[:success] = "Word Successfully Updated!"
          redirect_to admin_category_words_url
        else
          render 'edit'
        end
    end

    def destroy
      Word.find(params[:id]).destroy
      flash[:success] = "Word Deleted"
      redirect_to admin_category_words_url
    end
    
    private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
    end
  end
end
