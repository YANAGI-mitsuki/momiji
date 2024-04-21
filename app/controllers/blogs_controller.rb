class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end
    def show
        @blog = Blog.find(params[:id])
    end
    def edit
        @blog = Blog.find(params[:id])
    end
    def update
        @blog = Blog.find(params[:id])
        # blog_paramsメソッドを呼び出し、blog_paramsメソッドの返り値をblog変数に代入する
        # update(更新するカラム: 更新値)である。
        # blog_paramsメソッドの返り値のデータ構造は、ハッシュ型であり、{更新するカラム: 更新値}という形式である。
        # だからupdateの引数として、blog_paramsメソッドの返り値をそのまま渡すことができる。
        # blog_paramsメソッドの返り値の内容にしたがって、blogsテーブルのレコードが更新された場合、
        if @blog = Blog.update(blog_params)
            # blogs/:idに遷移するようにする
            redirect_to blog_path
        # blog_paramsメソッドの返り値の内容にしたがって、blogsテーブルのレコードが更新されなかった場合、
        else
            # edit.html.erbを表示する
            # redirect_to edit_blog_pathではダメなのか？
            # redirect_to edit_blog_pathとすると、editアクションが呼び出されるので、edit.html.erbが表示される。
            # だからいいのではないか？
            render 'edit'
        end
    end

    private
    def blog_params
        # リクエストパラメータにblogというキーがあれば、その値を受け取る
        # なければ、ActionController::ParameterMissingというエラーを発生させる
        # nameカラム、titleカラム、bodyカラムの値を受け取る（created_atカラムやupdated_atカラム等の他のカラムの値は受け取らない）
        params.require(:blog).permit(:name, :title, :body)
    end
end
