# to generate a migration file do:
# rails g migration <name-of-migration> 

class AddViewCountToQuestions < ActiveRecord::Migration[5.2]
  def change
    # use add_column to add columns to a table. It's
    # arguments are (in order):
    # - the table name as a symbol
    # - the new columns name as a symbol 
    # - the type of the new column 
    add_column(:questions, :view_count, :integer)

  end
end
