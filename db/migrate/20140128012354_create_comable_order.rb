class CreateComableOrder < ActiveRecord::Migration
  def change
    create_table :comable_orders do |t|
      t.references customer_table_name, null: false
      t.string :code, null: false
      t.timestamps
    end
  end

  private

  def customer_table_name
    Comable::Engine::config.customer_table.to_s.singularize
  end
end