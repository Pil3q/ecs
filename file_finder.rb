def newest_file_number(files_list)
  files_numbers = files_list.map { |file| file[0...3].to_i }
  files_numbers.max
end

def find_files_to_exec(files_list, db_status)
  files_to_exec = files_list.select { |file| file if file[0..3].to_i > db_status }
end

def sort_files_in_numerical_order(files_list)
  files_list.sort_by { |file| file[0...3].to_i }
end

def get_queries_from_file(filename)
  sql = File.open("./sqlfiles/#{filename}", 'rb', &:read)
  sql.split("\n")
end

def get_all_queries(files_list)
  files_list.map { |file| get_queries_from_file(file) }.flatten
end
