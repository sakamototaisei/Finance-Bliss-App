class SearchController < ApplicationController

  def search
    @model = params["search"]["model"]    #選択したmodelを@modelに代入
    @value = params["search"]["value"]    #検索にかけた文字列(ここではvalue)を@valueに代入
    @how = params["search"]["how"]        #選択した検索方法howを@howに代入
    @datas = search_for(@model, @value, @how)   #search_forの引数にインスタンス変数を定義@datasに最終的な結果が入る
  end

  private
  
  def match(model, value)
    if model == 'user'
      User.where(name: value)
    elsif model == 'post'
      Post.where(introduction: value)
    end
  end

  def partical(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'post'
      Post.where("introduction LIKE ?", "%#{value}%")
    end
  end

  def search_for(model, value, how)   #searchアクションで定義した情報が引数に入っている
    case how                          #検索方法のhowの中身がどれなのかwhenの条件分岐の中から探す処理
    when 'match'
      match(model, value)             #検索方法の引数に(model, value)を定義している
    when 'partical'                   #例えばhowがmatchの場合はdef matchの処理に進む
      partical(model, value)
    end
  end

end
