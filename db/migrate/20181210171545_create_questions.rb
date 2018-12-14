# To run all your remaining migrations, do:
# rails db:migrate

# To generate a model, do:
# rails g model <model-name> <...column-names>

# To look at the status of migrations (whether they're active
# or not), do:
# rails db:migrate:status

# To reverse the last migration, do:
# rails db:rollback

# Find the official guide to migrations at:
# https://edgeguides.rubyonrails.org/active_record_migrations.html

class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      #Automaticly generate an 'id' colomn that 
      # auto-increment and acts as our primary key 

      t.string :title # this creates a VARCHAR(255) column name "title"
      t.text :body # this creates a TEXT column named "body"

      t.timestamps
      # This will create two column create_at and updated_at 
      # which will auto-update.
    end
  end
end
