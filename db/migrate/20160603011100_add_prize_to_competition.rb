class AddPrizeToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :prize_description, :string
    add_column :competitions, :prize_value, :decimal
  end
end
