class FormObject

  include ActiveModel::Model
  attr_accessor :hoge,:fuga...



  def save
    # 各テーブルにデータを保存する処理を書く
  end
