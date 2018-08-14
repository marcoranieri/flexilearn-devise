class AddPriceToLessons < ActiveRecord::Migration[5.2]
  def change
    add_monetize :lessons, :price, currency: { present: false }
  end
end
