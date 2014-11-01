class CreateUsers < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.column "first_name", :string, :limit => 25 #,options #varchar type coloum
  		#t.tpye {binary, boolean, date, datetime, decimal, float, integer, string, text, time} "name", options{:[limit, default, null, precision, scale]}
  		t.string "last_name", :limit => 50
  		t.string "email", :default => "", :null => false
  		t.string "password", :limit => 40

  		# t.datetime "created_at"
  		# t.datetime "updated_at"
  		t.timestamps #includes created_at and updated_at
  	end
  end

  def down
  	drop_table :users
  end
end
