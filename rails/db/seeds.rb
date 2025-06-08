require 'csv'

City.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(City.table_name)

State.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(State.table_name)

attributes = CSV.read(Rails.root.join('db/data/states.csv'))
State.create(attributes.map { |data| { name: data[0], abbreviation: data[1] }})

states = State.pluck(:abbreviation, :id).to_h

attributes = CSV.read(Rails.root.join('db/data/cities.csv'))
City.create(attributes.map { |data| { name: data[0], state_id: states[data[1]], population: data[2].to_i }})