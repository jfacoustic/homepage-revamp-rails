class HomeController < ApplicationController
  def index
    @articles = Article.last(5).reverse
    @body = find_or_create_page.body
  end

  def edit
    @page = find_or_create_page
  end
  def update
    @page = PageInfo.find_by_path '/'

    if @page.update(page_params)
      redirect_to '/'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def page_params
    params.require(:page_info).permit(:body)
  end

  def find_or_create_page
    page = PageInfo.find_by_path '/'
    if page
      page
    else
      page = PageInfo.new(path: '/', body: '')
      page.save
      page
    end
  end
end