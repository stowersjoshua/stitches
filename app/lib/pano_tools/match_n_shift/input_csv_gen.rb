require 'csv'


# class

# %w[file_name yaw pitch role x y z]

CSV.open('project_5.csv', 'wb') do |csv|
  csv << ["fox", "1", "$90.00"]
end
