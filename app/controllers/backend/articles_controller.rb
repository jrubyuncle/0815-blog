module Backend
  class ArticlesController < BackendController
    before_action :set_backend_article, only: [:show, :edit, :update, :destroy]

    # GET /backend/articles
    # GET /backend/articles.json
    def index
      @backend_articles = Backend::Article.all
    end

    # GET /backend/articles/1
    # GET /backend/articles/1.json
    def show
    end

    # GET /backend/articles/new
    def new
      @backend_article = Backend::Article.new
    end

    # GET /backend/articles/1/edit
    def edit
    end

    # POST /backend/articles
    # POST /backend/articles.json
    def create
      @backend_article = Backend::Article.new(backend_article_params)

      respond_to do |format|
        if @backend_article.save
          format.html { redirect_to @backend_article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @backend_article }
        else
          format.html { render :new }
          format.json { render json: @backend_article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/articles/1
    # PATCH/PUT /backend/articles/1.json
    def update
      respond_to do |format|
        if @backend_article.update(backend_article_params)
          format.html { redirect_to @backend_article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @backend_article }
        else
          format.html { render :edit }
          format.json { render json: @backend_article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/articles/1
    # DELETE /backend/articles/1.json
    def destroy
      @backend_article.destroy
      respond_to do |format|
        format.html { redirect_to backend_articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_backend_article
        @backend_article = Backend::Article.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def backend_article_params
        params.require(:backend_article).permit(:title, :content)
      end
  end
end
